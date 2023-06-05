import 'package:flutter/material.dart';
import 'package:stac_flutter/screen/widget/custom_text_field.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController idController = TextEditingController();
  TextEditingController pwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          customTextField(
            autofocus: true,
            hintText: "아이디를 입력해주세요",
            controller: idController,
            context: context,
          ),
          const SizedBox(height: 20),
          customTextField(
            autofocus: false,
            hintText: "비밀번호를 입력해주세요",
            controller: pwdController,
            context: context,
          ),
        ],
      ),
    );
  }
}
