import 'package:design_system/color/lotura_color.dart';
import 'package:flutter/material.dart';

class LoturaTextButton extends StatelessWidget {
  const LoturaTextButton(
      {super.key,
      this.text = const Text(
        "기본 텍스트",
        style: TextStyle(color: Colors.white),
      ),
      this.width = 382,
      this.height = 50,
      this.color,
      this.onPressed});

  final double width, height;
  final Text text;
  final Color? color;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color ?? LoturaColor.primary700,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: text,
        ),
      ),
    );
  }
}
