import 'package:design_system/button/lotura_icon_button.dart';
import 'package:design_system/button/lotura_text_button.dart';
import 'package:design_system/color/lotura_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoturaMessageBox extends StatelessWidget {
  const LoturaMessageBox({
    super.key,
    this.onPressed,
    this.margin,
  });

  final void Function()? onPressed;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: EdgeInsets.all(24.0.r),
      width: 382.0.r,
      height: 270.0.r,
      decoration: BoxDecoration(
        color: LoturaColor.white,
        border: Border.all(color: LoturaColor.gray200),
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "장치를 추가해서 기기들을 관리해보세요",
            style: TextStyle(fontSize: 20.0.sp),
          ),
          SizedBox(height: 20.0.r),
          LoturaIconButton(
              icon: Icon(Icons.add, color: LoturaColor.white),
              function: onPressed),
        ],
      ),
    );
  }
}
