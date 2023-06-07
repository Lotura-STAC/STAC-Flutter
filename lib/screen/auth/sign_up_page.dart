import 'package:flutter/material.dart';
import 'package:stac_flutter/common/common.dart';
import 'package:stac_flutter/screen/main/main_page.dart';
import 'package:stac_flutter/screen/widget/custom_text_field.dart';
import 'package:stac_flutter/service/auth/auth_service.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late TextEditingController idController;
  late TextEditingController pwdController;
  late TextEditingController pwdCheckController;

  @override
  void initState() {
    super.initState();
    idController = TextEditingController();
    pwdController = TextEditingController();
    pwdCheckController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    idController.dispose();
    pwdController.dispose();
    pwdCheckController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 100),
            CustomTextField(
                controller: idController,
                hintText: "아이디를 입력해주세요",
                textInputType: TextInputType.emailAddress,
                autofocus: true),
            const SizedBox(height: 20.0),
            CustomTextField(
                controller: pwdController,
                hintText: "비밀번호를 입력해주세요",
                textInputType: TextInputType.visiblePassword,
                autofocus: false),
            const SizedBox(height: 20.0),
            CustomTextField(
                controller: pwdCheckController,
                hintText: "비밀번호를 확인해주세요",
                textInputType: TextInputType.visiblePassword,
                autofocus: false),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: SizedBox(
            width: MediaQuery.of(context).size.width - 40,
            height: MediaQuery.of(context).size.height * 0.06,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: CustomColor.pointColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(99),
                ),
              ),
              onPressed: () {
                AuthService.signUp(idController.text, pwdController.text)
                    .then((value) {
                  if (value == 200) {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => MainPage()),
                        (route) => false);
                  }
                });
              },
              child: Text(
                "바로 시작하기",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
