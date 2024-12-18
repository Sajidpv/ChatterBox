import 'package:chatterbox/configs/app_configs/chat_types.dart';
import 'package:chatterbox/configs/app_configs/demo_chats.dart';
import 'package:chatterbox/configs/app_themes/colors.dart';
import 'package:chatterbox/configs/utils/extensions.dart';
import 'package:chatterbox/features/auth/model/user_model.dart';
import 'package:chatterbox/features/home/view/components/audio_messsage_type_component.dart';
import 'package:chatterbox/features/home/view/components/message_attachment_component.dart';

import 'package:chatterbox/features/home/view/widgets/chat_appbar_widget.dart';
import 'package:chatterbox/features/home/view/widgets/messag_status_row_widget.dart';
import 'package:chatterbox/features/home/view/widgets/message_widget.dart';
import 'package:flutter/material.dart';

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
  bool _showAttachment = false;
  bool _showOptions = false;

  void _updateAttachmentState() {
    setState(() {
      _showAttachment = !_showAttachment;
      _showOptions = false;
    });
  }

  void _updateOptionsState() {
    setState(() {
      _showAttachment = false;
      _showOptions = !_showOptions;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 16.0 / 2,
          ),
          margin: const EdgeInsets.symmetric(
            horizontal: 10.0,
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
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Type here..",
                              hintStyle: const TextStyle(
                                  color: AppPellet.accentGrey2,
                                  fontWeight: FontWeight.normal,
                                  height: .5),
                              suffixIcon: SizedBox(
                                child: InkWell(
                                  onTap: _updateAttachmentState,
                                  child: const Icon(
                                    Icons.attach_file,
                                    color: AppPellet.primaryColor,
                                  ),
                                ),
                              ),
                              filled: true,
                              fillColor: AppPellet.borderGrey.withOpacity(0.4),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16.0 * 1.5,
                              ),
                              border: const OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(18)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  10.width,
                  SizedBox(
                    child: InkWell(
                      onTap: _updateOptionsState,
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          decoration: const BoxDecoration(
                              color: AppPellet.primaryColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(18))),
                          child: const Icon(Icons.mic,
                              color: AppPellet.whiteBackground)),
                    ),
                  ),
                ],
              ),
              if (_showAttachment) const MessageAttachment(),
            ],
          ),
        ),
        if (_showOptions) const AudioMesssageTypeComponent()
      ],
    );
  }
}
