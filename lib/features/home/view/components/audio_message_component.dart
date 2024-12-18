import 'package:chatterbox/configs/app_themes/colors.dart';
import 'package:chatterbox/configs/utils/utils.dart';
import 'package:chatterbox/features/home/model/message_model.dart';
import 'package:chatterbox/features/home/view/components/message_status_component.dart';
import 'package:flutter/material.dart';

class AudioMessage extends StatelessWidget {
  final ChatMessage? message;

  const AudioMessage({super.key, this.message});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.55,
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0 * 0.75,
            vertical: 16.0 / 2.5,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppPellet.primaryColor.withOpacity(0.1),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                    color: message!.isSender
                        ? AppPellet.whiteBackground
                        : AppPellet.black.withOpacity(.08),
                    borderRadius: const BorderRadius.all(Radius.circular(13))),
                child: const Icon(
                  Icons.play_arrow,
                  color: AppPellet.blackAccent,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0 / 2),
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 2,
                        color: AppPellet.primaryColor.withOpacity(0.4),
                      ),
                      Positioned(
                        left: 0,
                        child: Container(
                          height: 8,
                          width: 8,
                          decoration: const BoxDecoration(
                            color: AppPellet.primaryColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const Positioned(
            bottom: 5,
            left: 56,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '0.33',
                  style: TextStyle(
                    fontSize: 9,
                    color: AppPellet.accentGrey2,
                  ),
                ),
              ],
            )),
        Positioned(
          bottom: 5,
          right: 20,
          child: Row(
            children: [
              timeSlot(),
              if (message!.isSender)
                MessageStatusDotComponent(status: message?.messageStatus),
            ],
          ),
        ),
      ],
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
