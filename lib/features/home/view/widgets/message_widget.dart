import 'package:chatterbox/features/auth/model/user_model.dart';
import 'package:chatterbox/features/home/model/message_model.dart';
import 'package:chatterbox/features/home/view/components/audio_message_component.dart';
import 'package:chatterbox/features/home/view/components/custom_audio_alert_dialog.dart';
import 'package:chatterbox/features/home/view/components/text_message_component.dart';
import 'package:flutter/material.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget({
    super.key,
    required this.message,
    required this.user,
  });

  final ChatMessage message;
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    Widget messageContent(ChatMessage message) {
      switch (message.messageType) {
        case ChatMessageType.text:
          return TextMessage(message: message);
        case ChatMessageType.audio:
          return GestureDetector(
            onLongPress: message.isExpanded
                ? () => showAudioMessageDialog(context, message)
                : null,
            child: AudioMessage(message: message),
          );
        default:
          return const SizedBox();
      }
    }

    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Row(
        mainAxisAlignment:
            message.isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!message.isSender) ...[
            CircleAvatar(
              radius: 12,
              backgroundImage: NetworkImage(user.image ?? ''),
            ),
            const SizedBox(width: 16.0 / 2),
          ],
          Material(
            elevation: 1,
            borderRadius: BorderRadius.circular(10),
            child: messageContent(message),
          ),
        ],
      ),
    );
  }
}
