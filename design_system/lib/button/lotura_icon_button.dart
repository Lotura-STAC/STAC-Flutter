import 'package:design_system/color/lotura_color.dart';
import 'package:flutter/material.dart';

class LoturaIconButton extends StatelessWidget {
  const LoturaIconButton(
      {super.key,
      required this.width,
      required this.height,
      required this.iconSize,
      required this.iconColor,
      required this.iconData,
      this.function});

  final double width, height, iconSize;
  final Color iconColor;
  final IconData iconData;
  final Function? function;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function != null ? () => function : null,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: LoturaColor.primary700,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Center(
          child: Icon(iconData, size: iconSize, color: iconColor),
        ),
      ),
    );
  }
}
