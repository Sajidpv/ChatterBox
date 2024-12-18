import 'package:chatterbox/configs/app_themes/colors.dart';
import 'package:chatterbox/configs/utils/extensions.dart';
import 'package:flutter/material.dart';

class AudioMesssageTypeComponent extends StatelessWidget {
  const AudioMesssageTypeComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AudioTypeCards(
            iconData: Icons.send_outlined,
            title: "Send as Chat",
            press: () {},
            color: AppPellet.primaryColor,
          ),
          10.width,
          AudioTypeCards(
            iconData: Icons.receipt_long,
            title: "Send as Order",
            press: () {},
            color: AppPellet.greenColor,
          ),
        ],
      ),
    );
  }
}

class AudioTypeCards extends StatelessWidget {
  final VoidCallback press;
  final IconData iconData;
  final String title;
  final Color color;

  const AudioTypeCards(
      {super.key,
      required this.press,
      required this.iconData,
      required this.title,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      child: InkWell(
        onTap: press,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: color.withOpacity(.2),
          ),
          child: Row(
            children: [
              Icon(
                iconData,
                size: 20,
                color: color,
              ),
              4.width,
              Text(
                title,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: color.withOpacity(0.8),
                    ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
