import 'package:chatterbox/configs/app_themes/colors.dart';
import 'package:flutter/material.dart';

Widget buildChoiceChip(
  String label,
  Color color,
  bool selected,
  Function(bool) onSelected,
) {
  return ChoiceChip(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
    ),
    showCheckmark: false,
    side: BorderSide.none,
    selectedColor: AppPellet.black,
    backgroundColor: color.withOpacity(0.2),
    label: Text(
      label,
      style: TextStyle(
        color: selected ? Colors.white : color,
        fontSize: 12,
      ),
    ),
    selected: selected,
    onSelected: onSelected,
  );
}
