import 'package:design_system/text_field/lotura_text_field.dart';
import 'package:flutter/material.dart';

class LoturaTextFieldView extends StatelessWidget {
  LoturaTextFieldView({super.key});

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Text("기본 텍스트 핖드"),
              LoturaTextField(controller: controller),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            children: [
              Text("비밀번호 텍스트 필드"),
              LoturaTextField(
                controller: controller,
                isPasswordTextField: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
