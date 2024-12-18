import 'package:chatterbox/configs/app_themes/colors.dart';
import 'package:flutter/material.dart';

class MessageAttachment extends StatelessWidget {
  const MessageAttachment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MessageAttachmentCard(
            iconData: Icons.insert_drive_file,
            title: "Document",
            press: () {},
          ),
          MessageAttachmentCard(
            iconData: Icons.image,
            title: "Gallary",
            press: () {},
          ),
          MessageAttachmentCard(
            iconData: Icons.headset,
            title: "Audio",
            press: () {},
          ),
          MessageAttachmentCard(
            iconData: Icons.videocam,
            title: "Video",
            press: () {},
          ),
        ],
      ),
    );
  }
}

class MessageAttachmentCard extends StatelessWidget {
  final VoidCallback press;
  final IconData iconData;
  final String title;

  const MessageAttachmentCard(
      {super.key,
      required this.press,
      required this.iconData,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.all(16.0 / 2),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16.0 * 0.75),
              decoration: const BoxDecoration(
                color: AppPellet.primaryColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                iconData,
                size: 20,
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
            ),
            const SizedBox(height: 16.0 / 2),
            Text(
              title,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .color!
                        .withOpacity(0.8),
                  ),
            )
          ],
        ),
      ),
    );
  }
}
