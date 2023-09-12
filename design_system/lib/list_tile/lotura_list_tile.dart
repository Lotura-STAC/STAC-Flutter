import 'package:design_system/color/lotura_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoturaListTile extends StatelessWidget {
  const LoturaListTile({
    super.key,
    required this.width,
    required this.height,
    required this.device,
    required this.text,
    required this.status,
    this.onPressed,
  });

  final double width, height;
  final int device, status;
  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: 12.0.r, bottom: 12.0.r, left: 24.0.r, right: 12.0.r),
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: LoturaColor.white,
        border: Border.all(color: LoturaColor.gray200),
        borderRadius: const BorderRadius.all(Radius.circular(16.0)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                device == 0 ? Icons.add : Icons.accessible_forward_rounded,
                size: 28.0.r,
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
                status == 0 ? Icons.accessible : Icons.ac_unit,
                size: 24.0.r,
              ),
              IconButton(
                  onPressed: onPressed, icon: const Icon(Icons.more_horiz))
            ],
          ),
        ],
      ),
    );
  }
}
