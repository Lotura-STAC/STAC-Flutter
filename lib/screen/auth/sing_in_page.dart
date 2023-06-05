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
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
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
            SizedBox(
              width: MediaQuery.of(context).size.width - 40,
              height: MediaQuery.of(context).size.height * 0.06,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffc4a6ea),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(99),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  "로그인",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
