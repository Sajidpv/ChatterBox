import 'dart:io';

import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:chatterbox/configs/utils/utils.dart';
import 'package:chatterbox/features/home/view/components/permission_request.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  HomeProvider() {
    _playerController.onPlayerStateChanged.listen((state) {
      _isPlaying = state == PlayerState.playing;
      notifyListeners();
    });
    initRecordController();
  }
  int selectedChipIndex = 0;
  bool _showAttachment = false;
  bool _showOptions = false;
  bool _isAudioRecording = false;
  bool _isPlaying = false;
  bool get isPlaying => _isPlaying;
  bool get showAttchment => _showAttachment;
  bool get showOptions => _showOptions;
  bool get isAudioRecording => _isAudioRecording;
  late final RecorderController _recorderController;
  final PlayerController _playerController = PlayerController();
  Duration _currentDuration = Duration.zero;
  RecorderController get recorderController => _recorderController;
  PlayerController get playerController => _playerController;
  Duration get currentDuration => _currentDuration;
  String? get filePath => _filePath;
  String? _filePath;

  void updateAttachmentState() {
    _showAttachment = !_showAttachment;
    _showOptions = false;
    _isAudioRecording = false;
    notifyListeners();
  }

  void initRecordController() {
    _recorderController = RecorderController()
      ..androidEncoder = AndroidEncoder.aac
      ..androidOutputFormat = AndroidOutputFormat.mpeg4
      ..iosEncoder = IosEncoder.kAudioFormatMPEG4AAC
      ..sampleRate = 16000;
  }

  void setDuration() {
    _recorderController.onCurrentDuration.listen((duration) {
      _currentDuration = duration;
      notifyListeners();
    });
  }

  void updateOptionsState() {
    _showAttachment = false;
    _showOptions = !_showOptions;
    _isAudioRecording = !_isAudioRecording;
    notifyListeners();
  }

  void handleChipSelected(int index) {
    selectedChipIndex = index;

    notifyListeners();
  }

  Future<void> pickFile(BuildContext context, List<String> fileType) async {
    if (await requestPermissions(context)) {
      FilePickerResult? result = await FilePicker.platform
          .pickFiles(type: FileType.custom, allowedExtensions: fileType);

      if (result != null) {
        PlatformFile file = result.files.first;

        String? fileName = file.name;
        String? filePath = file.path;
        String? fileExtension = file.extension;

        // Show a dialog with the file details (for demonstration purposes)
        showDialog(
          // ignore: use_build_context_synchronously
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('File Selected'),
            content: Text(
              'Name: $fileName\n'
              'Path: $filePath\n'
              'Extension: $fileExtension',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Close'),
              ),
            ],
          ),
        );

        // Use the file's path for further operations like uploading or displaying
      } else {
        // ignore: use_build_context_synchronously
        Utils.snackBar("No file selected.", context);
      }
    } else {
      // ignore: use_build_context_synchronously
      Utils.snackBar("Permission denied.", context);
    }
  }

  Future<String?> stopRecording() async {
    try {
      _filePath = await _recorderController.stop();
      notifyListeners();
      return filePath;
    } catch (e) {
      if (kDebugMode) {
        print("Error stopping recording: $e");
      }
      return null;
    }
  }

  Future<void> playRecording() async {
    if (filePath != null) {
      _isPlaying = true;
      notifyListeners();
      await _playerController.preparePlayer(path: filePath ?? '');
      playerController.startPlayer();
    }
  }

  Future<void> pausePlayback() async {
    if (_isPlaying) {
      _isPlaying = false;
      await playerController.pausePlayer();
      notifyListeners();
    }
  }
  // Future<String?> stopRecording() async {
  //   try {
  //     if (_recorderController.isRecording) {
  //       _filePath = await _recorderController.stop();

  //       Utils.toastMessage("Recording stopped. File saved at: $filePath");
  //       notifyListeners();
  //       return filePath;
  //     } else {
  //       notifyListeners();
  //       if (kDebugMode) {
  //         print("Recording is not in progress.");
  //       }
  //     }
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print("Error stopping recording: $e");
  //     }
  //   }
  //   return null;
  // }

  Future<void> deleteRecording(String? filePath) async {
    // Stop the recorder if it's currently recording
    if (_recorderController.isRecording) {
      try {
        await _recorderController.stop();
        _showAttachment = false;
        _showOptions = false;
        _isAudioRecording = false;
        notifyListeners();
      } catch (e) {
        if (kDebugMode) {
          print("Error stopping recorder: $e");
        }
      }
    }

    // Delete the file if it exists
    final file = File(filePath ?? '');
    if (await file.exists()) {
      await file.delete();

      Utils.toastMessage("Recording deleted: $filePath");
      filePath = null;
      clearFields();
      notifyListeners();
    } else {
      clearFields();
      notifyListeners();
      if (kDebugMode) {
        print("File not found for deletion.");
      }
    }
  }

  void clearFields() {
    selectedChipIndex = 0;
    _showAttachment = false;
    _showOptions = false;
    _isAudioRecording = false;
    _currentDuration = const Duration(seconds: 0);
    _filePath = null;
    notifyListeners();
  }

  @override
  void dispose() {
    _recorderController.dispose();
    _playerController.dispose();
    super.dispose();
  }
}
