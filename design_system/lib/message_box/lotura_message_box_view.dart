import 'package:design_system/color/lotura_color.dart';
import 'package:design_system/message_box/lotura_message_box.dart';
import 'package:flutter/material.dart';

class LoturaMessageBoxView extends StatelessWidget {
  const LoturaMessageBoxView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LoturaColor.gray100,
      body: Center(
        child: LoturaMessageBox(),
      ),
    );
  }
}
