import 'package:design_system/color/lotura_color.dart';
import 'package:flutter/material.dart';

class LoturaIconButton extends StatelessWidget {
  const LoturaIconButton(
      {super.key,
      this.width = 382,
      this.height = 50,
      required this.icon,
      this.function});

  final double width, height;
  final Icon icon;
  final void Function()? function;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: LoturaColor.primary700,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Center(
          child: icon,
        ),
      ),
    );
  }
}
