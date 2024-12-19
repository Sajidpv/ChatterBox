import 'package:chatterbox/configs/app_configs/demo_user_list.dart';
import 'package:chatterbox/configs/app_themes/colors.dart';
import 'package:chatterbox/configs/routes/route_names.dart';
import 'package:chatterbox/features/auth/model/user_model.dart';
import 'package:chatterbox/features/home/view/widgets/active_indicator_widget.dart';
import 'package:chatterbox/features/home/view/widgets/drawer.dart';
import 'package:chatterbox/features/home/view/widgets/messag_status_row_widget.dart';
import 'package:flutter/material.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPellet.whiteBackground,
      appBar: AppBar(
        title: const Text("Chats"),
      ),
      drawer: const AppDrawer(),
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
