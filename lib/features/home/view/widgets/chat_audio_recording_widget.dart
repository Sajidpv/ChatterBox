import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:chatterbox/configs/app_themes/colors.dart';
import 'package:chatterbox/configs/utils/extensions.dart';
import 'package:chatterbox/configs/utils/utils.dart';
import 'package:chatterbox/features/home/view/components/chat_field_icon_button_component.dart';
import 'package:chatterbox/features/home/view_model/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatAudioRecordingWidget extends StatefulWidget {
  const ChatAudioRecordingWidget({
    super.key,
  });

  @override
  State<ChatAudioRecordingWidget> createState() =>
      _ChatAudioRecordingWidgetState();
}

class _ChatAudioRecordingWidgetState extends State<ChatAudioRecordingWidget> {
  @override
  void initState() {
    super.initState();
    final provider = context.homeProvider;
    provider.recorderController.record(
      androidEncoder: AndroidEncoder.aac,
      androidOutputFormat: AndroidOutputFormat.mpeg4,
      iosEncoder: IosEncoder.kAudioFormatMPEG4AAC,
    );
    provider.setDuration();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, provider, _) {
      return Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: provider.recorderController.isRecording
                ? ChatFieldIconButtonComponent(
                    onTap: () async {
                      await provider.stopRecording();
                    },
                    icon: Icons.pause_sharp,
                    iconColor: AppPellet.black,
                    bgColor: AppPellet.black.withOpacity(.07),
                  )
                : ChatFieldIconButtonComponent(
                    onTap: provider.clearFields,
                    icon: Icons.keyboard,
                    iconColor: AppPellet.whiteBackground,
                    bgColor: AppPellet.primaryColor,
                  ),
          ),
          Expanded(
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                provider.isPlaying
                    ? AudioFileWaveforms(
                        size: const Size(300, 40),
                        playerController: provider.playerController,
                        playerWaveStyle: const PlayerWaveStyle(
                          showSeekLine: true,
                          seekLineColor: AppPellet.redColor,
                        ),
                      )
                    : Container(
                        height: 50,
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: AudioWaveforms(
                            enableGesture: true,
                            size: const Size(300, 40),
                            recorderController: provider.recorderController,
                            waveStyle: const WaveStyle(
                              waveColor: AppPellet.redColor,
                              extendWaveform: true,
                              showMiddleLine: false,
                            ),
                          ),
                        ),
                      ),
                Positioned(
                  right: context.mediaQueryWidth * .2,
                  bottom: 5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 5,
                        height: 5,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppPellet.redColor),
                      ),
                      5.width,
                      Text(
                        Utils.formatDuration(provider.currentDuration),
                        style: const TextStyle(
                          fontSize: 10,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (!provider.recorderController.isRecording) ...[
            10.width,
            ChatFieldIconButtonComponent(
              onTap: () async {
                if (provider.isPlaying) {
                  await provider.pausePlayback();
                } else {
                  await provider.playRecording();
                }
              },
              icon: provider.isPlaying ? Icons.pause : Icons.play_arrow,
              iconColor: AppPellet.whiteBackground,
              bgColor: AppPellet.black,
            ),
          ],
          10.width,
          ChatFieldIconButtonComponent(
            onTap: () async {
              await provider.deleteRecording(provider.filePath ?? '');
            },
            icon: Icons.delete_outlined,
            iconColor: AppPellet.redColor,
            bgColor: AppPellet.redColor.withOpacity(.07),
          ),
        ],
      );
    });
  }
}
