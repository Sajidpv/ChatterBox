import 'package:chatterbox/configs/app_configs/chat_types.dart';
import 'package:chatterbox/configs/app_configs/demo_chats.dart';
import 'package:chatterbox/configs/app_themes/colors.dart';
import 'package:chatterbox/configs/utils/extensions.dart';
import 'package:chatterbox/features/auth/model/user_model.dart';
import 'package:chatterbox/features/home/view/components/audio_messsage_type_component.dart';
import 'package:chatterbox/features/home/view/components/message_attachment_component.dart';
import 'package:chatterbox/features/home/view/widgets/chat_appbar_widget.dart';
import 'package:chatterbox/features/home/view/widgets/chat_audio_recording_widget.dart';
import 'package:chatterbox/features/home/view/widgets/chat_input_field_widget.dart';
import 'package:chatterbox/features/home/view/widgets/messag_status_row_widget.dart';
import 'package:chatterbox/features/home/view/widgets/message_widget.dart';
import 'package:chatterbox/features/home/view_model/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key, required this.user});
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPellet.whiteBackground.withOpacity(.95),
      appBar: PreferredSize(
          preferredSize: Size(context.mediaQueryWidth, 42),
          child: ChatAppBarWidget(user: user)),
      body: Column(
        children: [
          MessageStatusWidget(
            length: chatStatus.length,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: ListView.builder(
                itemCount: demeChatMessages.length,
                itemBuilder: (context, index) => MessageWidget(
                  message: demeChatMessages[index],
                  user: user,
                ),
              ),
            ),
          ),
          const ChatInputField(),
        ],
      ),
    );
  }
}

class ChatInputField extends StatefulWidget {
  const ChatInputField({super.key});

  @override
  State<ChatInputField> createState() => _ChatInputFieldState();
}

class _ChatInputFieldState extends State<ChatInputField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 16.0 / 2,
      ),
      child: Consumer<HomeProvider>(builder: (context, provider, _) {
        return Column(
          children: [
            Material(
              elevation: .5,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 16.0 / 2,
                ),
                decoration: BoxDecoration(
                  color: AppPellet.whiteBackground,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, -4),
                      blurRadius: 32,
                      color: AppPellet.primaryColor.withOpacity(0.08),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    if (provider.showAttchment) const MessageAttachment(),
                    if (provider.isAudioRecording)
                      const ChatAudioRecordingWidget()
                    else
                      ChatInputFieldWidget(
                        onAttachmentTap: provider.updateAttachmentState,
                        onMicTap: provider.updateOptionsState,
                      ),
                  ],
                ),
              ),
            ),
            if (provider.showOptions) const AudioMesssageTypeComponent(),
          ],
        );
      }),
    );
  }
}
