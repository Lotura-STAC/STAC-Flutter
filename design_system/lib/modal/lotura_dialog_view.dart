import 'package:design_system/button/lotura_text_button.dart';
import 'package:design_system/color/lotura_color.dart';
import 'package:design_system/modal/lotura_dialog.dart';
import 'package:flutter/material.dart';

class LoturaDialogView extends StatelessWidget {
  const LoturaDialogView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LoturaColor.gray100,
      body: Center(
        child: LoturaTextButton(
          onPressed: () => showDialog(
              context: context, builder: (context) => LoturaDialog()),
          text: Text(
            "다이얼로그 창 열기",
            style: TextStyle(color: LoturaColor.white),
          ),
        ),
      ),
    );
  }
}
