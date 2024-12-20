import 'package:chatterbox/configs/app_themes/colors.dart';
import 'package:chatterbox/configs/utils/extensions.dart';
import 'package:chatterbox/features/auth/model/user_model.dart';
import 'package:chatterbox/features/home/view_model/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatAppBarWidget extends StatelessWidget {
  const ChatAppBarWidget({
    super.key,
    required this.user,
  });

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 20,
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back_ios),
      ),
      title: context.watch<HomeProvider>().isSearching
          ? Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: AppPellet.borderGrey.withOpacity(0.5),
                  ),
                ],
              ),
              child: TextField(
                controller: context.homeProvider.searchController,
                decoration: const InputDecoration(
                  hintText: 'Search...',
                  border: InputBorder.none,
                ),
              ),
            )
          : Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(user.image ?? ''),
                ),
                8.width,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.name ?? 'No user',
                      style: const TextStyle(fontSize: 16),
                    ),
                    Text(
                      user.time ?? '',
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
      actions: [
        IconButton(
            icon: Icon(context.watch<HomeProvider>().isSearching
                ? Icons.close
                : Icons.search),
            onPressed: context.homeProvider.isSearch),
      ],
    );
  }
}
