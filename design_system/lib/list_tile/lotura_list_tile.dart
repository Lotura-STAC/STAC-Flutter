import 'package:design_system/color/lotura_color.dart';
import 'package:design_system/icon/lotura_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoturaListTile extends StatelessWidget {
  const LoturaListTile({
    super.key,
    required this.width,
    required this.height,
    required this.deviceType,
    required this.text,
    required this.status,
    this.margin,
    this.onPressed,
    this.onLongPressed,
  });

  final double width, height;
  final int status;
  final EdgeInsetsGeometry? margin;
  final String text, deviceType;
  final void Function()? onPressed;
  final void Function()? onLongPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: onLongPressed,
      onTap: onPressed,
      child: Container(
        margin: margin,
        padding: EdgeInsets.only(
            top: 12.0.r, bottom: 12.0.r, left: 24.0.r, right: 12.0.r),
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: status == 0 ? LoturaColor.primary50 : LoturaColor.green50,
          border: Border.all(color: LoturaColor.gray200),
          borderRadius: const BorderRadius.all(Radius.circular(16.0)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  deviceType == 'DRY' ? LoturaIcons.dry : LoturaIcons.laundry,
                  size: 28.0.r,
                  color: LoturaColor.gray300,
                ),
                SizedBox(width: 20.0.r),
                Text(
                  text,
                  style: TextStyle(fontSize: 16.0.sp),
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  status == 0 ? LoturaIcons.working : LoturaIcons.checkCircle,
                  size: 22.0.r,
                  color: status == 0
                      ? LoturaColor.primary700
                      : LoturaColor.green700,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      left: status == 0 ? 20.0.r : 16.0.r, right: 12.0.r),
                  child: const Icon(Icons.more_horiz),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
