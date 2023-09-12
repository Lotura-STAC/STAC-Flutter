import 'package:design_system/button/lotura_text_button.dart';
import 'package:design_system/color/lotura_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoturaMessageBox extends StatelessWidget {
  const LoturaMessageBox({super.key, this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          SizedBox(height: 20.0, child: Text("추가할 예정"),),
          Column(
            children: [
              Text(
                "장치를 추가해서 기기들을 관리해보세요",
                style: TextStyle(fontSize: 18.0.sp),
              ),
              SizedBox(height: 20.0.r),
              LoturaTextButton(
                onPressed: onPressed,
                text: Text(
                  "장치 추가하기",
                  style: TextStyle(
                    fontSize: 18.0.sp,
                    color: LoturaColor.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
