import 'package:chatterbox/configs/app_themes/colors.dart';
import 'package:chatterbox/features/home/model/message_model.dart';
import 'package:flutter/material.dart';

class MessageStatusDotComponent extends StatelessWidget {
  final MessageStatus? status;

  const MessageStatusDotComponent({super.key, this.status});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 2),
      height: 18,
      width: 18,
      child: Icon(
        _getMessageStatusIcon(status!),
        size: 14,
        color: dotColor(status!),
      ),
    );
  }

  IconData _getMessageStatusIcon(MessageStatus status) {
    switch (status) {
      case MessageStatus.notSent:
        return Icons.refresh;
      case MessageStatus.viewed:
        return Icons.done_all;
      case MessageStatus.notView:
        return Icons.done;
      default:
        return Icons.help;
    }
  }

  Color dotColor(MessageStatus status) {
    switch (status) {
      case MessageStatus.notSent:
        return AppPellet.redColor;
      case MessageStatus.notView:
        return AppPellet.borderGrey;
      case MessageStatus.viewed:
        return AppPellet.primaryColor;
      default:
        return Colors.transparent;
    }
  }
}
