import 'package:design_system/button/lotura_icon_text_button.dart';
import 'package:design_system/button/lotura_text_button.dart';
import 'package:design_system/color/lotura_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoturaBottomSheet extends StatelessWidget {
  const LoturaBottomSheet({
    super.key,
    required this.subtitle,
    required this.title,
    required this.leftText,
    required this.rightText,
    required this.onLeftPressed,
    required this.onRightPressed,
    required this.leftIcon,
    required this.rightIcon,
  });

  final String subtitle, title, leftText, rightText;
  final Icon leftIcon, rightIcon;
  final void Function()? onLeftPressed, onRightPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 250.0.r,
      child: Padding(
        padding: EdgeInsets.only(
            left: 24.0.r, right: 24.0.r, top: 12.0.r, bottom: 12.0.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 16.0.sp),
                ),
                SizedBox(height: 10.0.r),
                Text(
                  title,
                  style:
                      TextStyle(fontSize: 26.0.sp, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LoturaIconTextButton(
                  function: onLeftPressed,
                  color: LoturaColor.gray50,
                  width: 180.0.r,
                  text: Text(
                    leftText,
                    style:
                        TextStyle(color: LoturaColor.black, fontSize: 16.0.sp),
                  ),
                  icon: leftIcon,
                ),
                LoturaIconTextButton(
                  function: onRightPressed,
                  color: LoturaColor.gray50,
                  width: 180.0.r,
                  text: Text(
                    rightText,
                    style:
                        TextStyle(color: LoturaColor.black, fontSize: 16.0.sp),
                  ),
                  icon: rightIcon,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
