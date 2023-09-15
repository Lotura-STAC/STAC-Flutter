import 'package:design_system/button/lotura_text_button.dart';
import 'package:design_system/color/lotura_color.dart';
import 'package:flutter/material.dart';

class LoturaModalView extends StatelessWidget {
  const LoturaModalView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LoturaColor.gray100,
      body: Center(
        child: LoturaTextButton(
          text: Text(
            "모달 창 열기",
            style: TextStyle(color: LoturaColor.white),
          ),
        ),
      ),
    );
  }
}
