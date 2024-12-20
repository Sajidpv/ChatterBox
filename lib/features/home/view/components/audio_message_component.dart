import 'package:chatterbox/configs/app_themes/colors.dart';
import 'package:chatterbox/configs/utils/extensions.dart';
import 'package:chatterbox/configs/utils/utils.dart';
import 'package:chatterbox/features/home/model/message_model.dart';
import 'package:chatterbox/features/home/view/components/message_status_component.dart';
import 'package:flutter/material.dart';

class AudioMessage extends StatelessWidget {
  final ChatMessage? message;

  const AudioMessage({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 50,
          child: Stack(
            children: [
              Container(
                width: message?.isExpanded == true
                    ? 285
                    : MediaQuery.of(context).size.width * 0.55,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0 * 0.75,
                  vertical: 16.0 / 2.5,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: message?.isExpanded == true
                      ? AppPellet.whiteBackground
                      : AppPellet.primaryColor.withOpacity(0.1),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: message!.isSender
                            ? AppPellet.whiteBackground
                            : AppPellet.black.withOpacity(.08),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(13)),
                      ),
                      child: const Icon(
                        Icons.play_arrow,
                        color: AppPellet.blackAccent,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: 16.0 / 2),
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
                ),
              ),
              if (message?.isExpanded == false)
                Positioned(
                  bottom: 5,
                  right: 20,
                  child: Row(
                    children: [
                      timeSlot(),
                      if (message!.isSender)
                        MessageStatusDotComponent(
                            status: message?.messageStatus),
                    ],
                  ),
                ),
            ],
          ),
        ),
        // Removed Expanded here
        if (message?.isExpanded == true) ...[
          expansionTileWidget(context,
              title: "Transcript", description: message!.transcript.toString()),
          expansionTileWidget(context,
              title: "Order List",
              description:
                  '${message!.orderList[0].toString()}\n${message!.orderList[1].toString()}'),
          5.height,
          const Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.receipt_long,
                  size: 20,
                ),
                Text('Order No: 155544'),
              ],
            ),
          ),
          10.height,
          Padding(
            padding: const EdgeInsets.only(left: 10.0, bottom: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppPellet.greenColor.withOpacity(.2)),
                  child: const Text(
                    'Approved by DP on 12:30pm, 25/08/2024',
                    style: TextStyle(color: AppPellet.greenColor, fontSize: 10),
                  ),
                ),
                5.width,
                const Text(
                  'V2',
                  style: TextStyle(color: AppPellet.greenColor, fontSize: 10),
                ),
                10.width,
                timeSlot(),
                MessageStatusDotComponent(status: message?.messageStatus),
              ],
            ),
          )
        ]
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

  Widget expansionTileWidget(context,
      {required String title, required String description}) {
    return SizedBox(
      width: 285,
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          visualDensity: const VisualDensity(vertical: -4, horizontal: -4),
          title: Text(
            title,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 8, 8, 4),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  description,
                  style: const TextStyle(fontSize: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
