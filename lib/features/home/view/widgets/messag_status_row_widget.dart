import 'package:chatterbox/configs/app_configs/chat_types.dart';
import 'package:chatterbox/configs/app_themes/colors.dart';
import 'package:chatterbox/configs/utils/extensions.dart';
import 'package:chatterbox/features/home/view/components/choice_chip.dart';
import 'package:chatterbox/features/home/view_model/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MessageStatusWidget extends StatelessWidget {
  const MessageStatusWidget({
    super.key,
    required this.length,
  });
  final int length;
  @override
  Widget build(BuildContext context) {
    return Material(
        elevation: 2,
        color: AppPellet.whiteBackground,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
          child: SizedBox(
            height: 50,
            width: context.mediaQueryWidth,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: length,
              itemBuilder: (BuildContext context, int index) {
                return Consumer<HomeProvider>(
                  builder: (context, provider, _) {
                    return buildChoiceChip(
                      chatStatus[index],
                      statusColors[index],
                      provider.selectedChipIndex == index,
                      (bool selected) {
                        provider.handleChipSelected(index);
                      },
                    );
                  },
                );
              },
              separatorBuilder: (BuildContext context, int index) => 5.width,
            ),
          ),
        ));
  }
}
