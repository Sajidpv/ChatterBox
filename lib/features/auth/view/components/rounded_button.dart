import 'package:chatterbox/configs/app_themes/colors.dart';
import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final bool loading;
  final double? radius, width, height;
  final VoidCallback? onPress;
  const RoundButton({
    super.key,
    required this.title,
    this.loading = false,
    required this.onPress,
    this.radius = 4,
    this.width = 200,
    this.height = 40,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: AppPellet.primaryColor,
            borderRadius: BorderRadius.circular(radius!)),
        child: Center(
            child: loading
                ? const CircularProgressIndicator(
                    color: Colors.white,
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        title,
                        style: const TextStyle(
                            color: AppPellet.whiteBackground, fontSize: 18),
                      ),
                    ],
                  )),
      ),
    );
  }
}
