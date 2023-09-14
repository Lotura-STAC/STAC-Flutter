import 'package:design_system/color/lotura_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoturaCheckBox extends StatefulWidget {
  const LoturaCheckBox({
    super.key,
    required this.isSelected,
    this.onPressed,
    this.width,
    this.height,
  });

  final bool isSelected;
  final void Function()? onPressed;
  final double? width, height;

  @override
  State<LoturaCheckBox> createState() => _LoturaCheckBoxState();
}

class _LoturaCheckBoxState extends State<LoturaCheckBox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        width: widget.width ?? 25.0.r,
        height: widget.height ?? 25.0.r,
        decoration: BoxDecoration(
          color: widget.isSelected == true
              ? LoturaColor.primary900
              : LoturaColor.white,
          border: Border.all(color: LoturaColor.gray200, width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(99)),
        ),
      ),
    );
  }
}
