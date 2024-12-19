import 'package:flutter/material.dart';

class ChatFieldIconButtonComponent extends StatelessWidget {
  const ChatFieldIconButtonComponent({
    super.key,
    required this.onTap,
    required this.icon,
    required this.iconColor,
    required this.bgColor,
  });

  final VoidCallback onTap;
  final IconData icon;
  final Color iconColor, bgColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: const BorderRadius.all(Radius.circular(18)),
          ),
          child: Icon(
            icon,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}
