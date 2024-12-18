import 'package:chatterbox/configs/app_configs/chat_types.dart';
import 'package:chatterbox/configs/app_configs/demo_user_list.dart';
import 'package:chatterbox/configs/app_themes/colors.dart';
import 'package:chatterbox/configs/routes/route_names.dart';
import 'package:chatterbox/configs/utils/extensions.dart';
import 'package:chatterbox/features/auth/model/user_model.dart';
import 'package:chatterbox/features/home/view/components/choice_chip.dart';
import 'package:chatterbox/features/home/view/widgets/messag_status_row_widget.dart';
import 'package:chatterbox/features/home/view_model/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPellet.whiteBackground,
      appBar: AppBar(
        title: const Text("Chats"),
      ),
      body: Column(
        children: [
          const MessageStatusWidget(
            length: 2,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: chatsData.length,
              itemBuilder: (context, index) => ChatCard(
                chat: chatsData[index],
                press: () => Navigator.pushNamed(context, RoutesName.chat,
                    arguments: chatsData[index]),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppPellet.primaryColor,
        child: const Icon(
          Icons.person_add_alt_1,
          color: AppPellet.whiteBackground,
        ),
      ),
    );
  }
}

class ChatCard extends StatelessWidget {
  const ChatCard({
    super.key,
    required this.chat,
    required this.press,
  });

  final UserModel chat;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0 * 0.75),
        child: Row(
          children: [
            CircleAvatarWithActiveIndicator(
              image: chat.image,
              isActive: chat.isActive,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      chat.name ?? "",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 8),
                    Opacity(
                      opacity: 0.64,
                      child: Text(
                        chat.lastMessage ?? 'Tap to start chating',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Opacity(
              opacity: 0.64,
              child: Text(chat.time ?? ''),
            ),
          ],
        ),
      ),
    );
  }
}

class FillOutlineButton extends StatelessWidget {
  const FillOutlineButton({
    super.key,
    this.isFilled = true,
    required this.press,
    required this.text,
  });

  final bool isFilled;
  final VoidCallback press;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: chatStatus.length,
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
    );
    // return MaterialButton(
    //   shape: RoundedRectangleBorder(
    //     borderRadius: BorderRadius.circular(30),
    //     side: const BorderSide(color: AppPellet.whiteBackground),
    //   ),
    //   elevation: isFilled ? 2 : 0,
    //   color: isFilled ? AppPellet.whiteBackground : Colors.transparent,
    //   onPressed: press,
    //   child: Text(
    //     text,
    //     style: TextStyle(
    //       color: isFilled ? const Color(0xFF1D1D35) : AppPellet.whiteBackground,
    //       fontSize: 12,
    //     ),
    //   ),
    // );
  }
}

class CircleAvatarWithActiveIndicator extends StatelessWidget {
  const CircleAvatarWithActiveIndicator({
    super.key,
    this.image,
    this.radius = 24,
    this.isActive,
  });

  final String? image;
  final double? radius;
  final bool? isActive;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: radius,
          backgroundImage: NetworkImage(image!),
        ),
        if (isActive!)
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              height: 16,
              width: 16,
              decoration: BoxDecoration(
                color: const Color(0xFF00BF6D),
                shape: BoxShape.circle,
                border: Border.all(
                    color: Theme.of(context).scaffoldBackgroundColor, width: 3),
              ),
            ),
          )
      ],
    );
  }
}
