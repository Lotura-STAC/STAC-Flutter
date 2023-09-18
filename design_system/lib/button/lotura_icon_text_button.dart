import 'package:design_system/color/lotura_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoturaIconTextButton extends StatelessWidget {
  const LoturaIconTextButton({
    super.key,
    this.width,
    this.height,
    required this.text,
    required this.icon,
    this.function,
    this.color,
  });

  final double? width, height;
  final Icon icon;
  final Color? color;
  final Text text;
  final void Function()? function;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        width: width ?? 150.0.r,
        height: height ?? 80.0.r,
        decoration: BoxDecoration(
          color: color ?? LoturaColor.gray200,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            SizedBox(height: 5.0.r),
            text,
          ],
        ),
      ),
    );
  }
}
