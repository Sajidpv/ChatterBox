import 'package:chatterbox/configs/app_themes/colors.dart';
import 'package:chatterbox/configs/utils/extensions.dart';
import 'package:chatterbox/features/home/view/components/chat_field_icon_button_component.dart';
import 'package:chatterbox/features/home/view_model/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatInputFieldWidget extends StatelessWidget {
  final VoidCallback onAttachmentTap;
  final VoidCallback onMicTap;

  const ChatInputFieldWidget({
    super.key,
    required this.onAttachmentTap,
    required this.onMicTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: context.homeProvider.controller,
                  onChanged: context.homeProvider.enterMessage,
                  decoration: InputDecoration(
                    hintText: "Type here..",
                    hintStyle: const TextStyle(
                      color: AppPellet.accentGrey2,
                      fontWeight: FontWeight.normal,
                      height: 0.5,
                    ),
                    suffixIcon: SizedBox(
                      child: InkWell(
                        onTap: onAttachmentTap,
                        child: const Icon(
                          Icons.attach_file,
                          color: AppPellet.primaryColor,
                        ),
                      ),
                    ),
                    filled: true,
                    fillColor: AppPellet.borderGrey.withOpacity(0.4),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16.0 * 1.5,
                    ),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(18)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        ChatFieldIconButtonComponent(
          onTap: context.watch<HomeProvider>().controller.text.isEmpty
              ? onMicTap
              : () {},
          icon: context.watch<HomeProvider>().controller.text.isEmpty
              ? Icons.mic
              : Icons.send,
          bgColor: AppPellet.primaryColor,
          iconColor: AppPellet.whiteBackground,
        ),
      ],
    );
  }
}
