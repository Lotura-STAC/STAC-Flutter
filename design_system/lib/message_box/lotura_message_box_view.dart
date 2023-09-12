import 'package:design_system/message_box/lotura_message_box.dart';
import 'package:flutter/material.dart';

class LoturaMessageBoxView extends StatelessWidget {
  const LoturaMessageBoxView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LoturaMessageBox(),
      ),
    );
  }
}
