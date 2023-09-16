import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoturaDialog extends StatelessWidget {
  LoturaDialog({
    super.key,
    required this.title,
    required this.content,
    this.onPressed,
  });

  final Text title, content;
  final void Function()? onPressed;

  final TextStyle textStyle = TextStyle(fontSize: 18.0.sp);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: EdgeInsets.zero,
      title: title,
      content: content,
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                "취소",
                style: textStyle,
              ),
            ),
            TextButton(
              onPressed: onPressed,
              child: Text(
                "확인",
                style: textStyle,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
