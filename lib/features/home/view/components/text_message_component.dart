import 'package:chatterbox/configs/app_themes/colors.dart';
import 'package:chatterbox/configs/utils/extensions.dart';
import 'package:chatterbox/configs/utils/utils.dart';
import 'package:chatterbox/features/home/model/message_model.dart';
import 'package:chatterbox/features/home/view/components/message_status_component.dart';
import 'package:flutter/material.dart';

class TextMessage extends StatelessWidget {
  const TextMessage({
    super.key,
    this.message,
  });

  final ChatMessage? message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0 * 0.95,
        vertical: 16.0 / 2,
      ),
      decoration: BoxDecoration(
        color: message!.isSender
            ? AppPellet.whiteBackground
            : AppPellet.primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              Text(
                message!.text,
                style: const TextStyle(
                  color: AppPellet.black,
                ),
              ),
              if (!message!.isSender) ...[10.width, timeSlot()]
            ],
          ),
          if (message!.isSender)
            Row(
              children: [
                Row(
                  children: [
                    timeSlot(),
                    MessageStatusDotComponent(status: message?.messageStatus),
                  ],
                ),
              ],
            ),
        ],
      ),
    );
  }

  Text timeSlot() {
    return Text(
      Utils.getHourMinuteWithAmPm(message!.time),
      style: const TextStyle(
        fontSize: 9,
        color: AppPellet.accentGrey2,
      ),
    );
  }
}
