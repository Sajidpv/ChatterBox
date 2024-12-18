import 'package:chatterbox/configs/app_themes/colors.dart';
import 'package:chatterbox/features/home/model/message_model.dart';
import 'package:flutter/material.dart';

class MessageStatusDotComponent extends StatelessWidget {
  final MessageStatus? status;

  const MessageStatusDotComponent({super.key, this.status});
  @override
  Widget build(BuildContext context) {
    Color dotColor(MessageStatus status) {
      switch (status) {
        case MessageStatus.notSent:
          return AppPellet.redColor;
        case MessageStatus.notView:
          return Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.1);
        case MessageStatus.viewed:
          return AppPellet.primaryColor;
        default:
          return Colors.transparent;
      }
    }

    return Container(
      margin: const EdgeInsets.only(left: 16.0 / 2),
      height: 12,
      width: 12,
      decoration: BoxDecoration(
          color: dotColor(status!), borderRadius: BorderRadius.circular(3)),
      child: Icon(
        status == MessageStatus.notSent ? Icons.close : Icons.done,
        size: 8,
        color: Theme.of(context).scaffoldBackgroundColor,
      ),
    );
  }
}
