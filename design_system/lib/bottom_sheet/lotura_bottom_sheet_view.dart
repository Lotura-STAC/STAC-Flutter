import 'package:design_system/bottom_sheet/lotura_bottom_sheet.dart';
import 'package:design_system/button/lotura_text_button.dart';
import 'package:design_system/color/lotura_color.dart';
import 'package:flutter/material.dart';

class LoturaBottomSheetView extends StatelessWidget {
  const LoturaBottomSheetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LoturaColor.gray100,
      body: Center(
        child: LoturaTextButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(25.0))),
              builder: (context) => LoturaBottomSheet(
                subtitle: "장치 설정하기",
                title: "장치에 변경사항이 생겼나요?",
                leftText: "장치 삭제하기",
                leftIcon: Icon(Icons.restore_from_trash, color: Colors.red),
                rightText: "장치 수정하기",
                rightIcon: Icon(Icons.edit, color: Colors.blue),
                onLeftPressed: () {
                  print("장치 삭제하기");
                },
                onRightPressed: () {
                  print("장치 수정하기");
                },
              ),
            );
          },
          text: Text(
            "바텀시트 열기",
            style: TextStyle(color: LoturaColor.white),
          ),
        ),
      ),
    );
  }
}
