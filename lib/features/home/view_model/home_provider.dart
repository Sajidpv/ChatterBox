// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:chatterbox/configs/app_configs/demo_chats.dart';
import 'package:chatterbox/configs/utils/utils.dart';
import 'package:chatterbox/features/home/model/message_model.dart';
import 'package:chatterbox/features/home/view/components/permission_request.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomeProvider with ChangeNotifier {
  HomeProvider() {
    messages = demeChatMessages;
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
  List<ChatMessage> messages = [];
  bool _isPlaying = false;
  bool get isPlaying => _isPlaying;
  bool get showAttchment => _showAttachment;
  bool get showOptions => _showOptions;
  bool get isAudioRecording => _isAudioRecording;
  late final RecorderController _recorderController;
  final PlayerController _playerController = PlayerController();
  final TextEditingController _controller = TextEditingController();
  bool _isSearching = false;
  bool get isSearching => _isSearching;
  TextEditingController _searchController = TextEditingController();
  TextEditingController get controller => _controller;
  TextEditingController get searchController => _searchController;
  Duration _currentDuration = Duration.zero;
  RecorderController get recorderController => _recorderController;
  PlayerController get playerController => _playerController;
  Duration get currentDuration => _currentDuration;
  String? get filePath => _filePath;
  String? _filePath;
  PlatformFile? _pickedFile;
  PlatformFile? get pickedFile => _pickedFile;

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

  void enterMessage(value) {
    _controller.text = value;
    notifyListeners();
  }

  void isSearch() {
    _isSearching = !_isSearching;
    searchController.clear();
    notifyListeners();
  }

  void setDuration() {
    _recorderController.onCurrentDuration.listen((duration) {
      _currentDuration = duration;
      notifyListeners();
    });
  }

  void sendMessage() {
    messages.add(ChatMessage(
        text: _controller.text,
        time: DateTime.now(),
        messageType: ChatMessageType.text,
        messageStatus: MessageStatus.notView,
        isSender: true));
    _controller.clear();
    notifyListeners();
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
      _showAttachment = false;

      if (result != null) {
        _pickedFile = result.files.first;
        notifyListeners();
      } else {
        Utils.snackBar("No file selected.", context);
      }
    } else {
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

  Future<void> deleteRecording(String? filePath) async {
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

    final file = File(filePath ?? '');
    if (await file.exists()) {
      await file.delete();

      if (kDebugMode) {
        print("Recording deleted: $filePath");
      }
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
    _controller.clear();
    _searchController.clear();
    super.dispose();
  }
}
