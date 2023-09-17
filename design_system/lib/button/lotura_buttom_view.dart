import 'package:design_system/button/lotura_icon_button.dart';
import 'package:design_system/button/lotura_icon_text_button.dart';
import 'package:design_system/button/lotura_text_button.dart';
import 'package:design_system/color/lotura_color.dart';
import 'package:flutter/material.dart';

class LoturaButtonView extends StatelessWidget {
  const LoturaButtonView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Text("아이콘 버튼"),
                LoturaIconButton(
                  icon: Icon(
                    Icons.add,
                    color: LoturaColor.white,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Column(
              children: [
                Text("텍스트 버튼"),
                LoturaTextButton(),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Column(
              children: [
                Text("아이콘 + 텍스트 버튼"),
                LoturaIconTextButton(
                  icon: Icon(Icons.add),
                  text: Text("더하기"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
