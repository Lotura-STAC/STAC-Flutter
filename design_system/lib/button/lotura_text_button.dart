import 'package:design_system/color/lotura_color.dart';
import 'package:flutter/material.dart';

class LoturaTextButton extends StatelessWidget {
  const LoturaTextButton(
      {super.key,
      required this.width,
      required this.height,
      required this.fontSize,
      required this.text,
      this.function});

  final double width, height, fontSize;
  final String text;
  final Function? function;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function != null ? () => function!() : null,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: LoturaColor.primary700,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontSize: fontSize, color: LoturaColor.white),
          ),
        ),
      ),
    );
  }
}
