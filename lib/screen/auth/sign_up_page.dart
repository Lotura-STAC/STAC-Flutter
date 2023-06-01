import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late TextEditingController idController;
  late TextEditingController pwdController;

  @override
  void initState() {
    super.initState();
    idController = TextEditingController();
    pwdController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    idController.dispose();
    pwdController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.keyboard_arrow_left,
            color: Colors.grey,
            size: 45,
          ),
        ),
        title: Text(
          "회원가입",
          style: TextStyle(color: Colors.black, fontSize: 30),
        ),
      ),
      body: Column(
        children: [
          _textField(idController, "아이디를 입력해주세요"),
          _textField(pwdController, "비밀번호를 입력해주세요"),
        ],
      ),
    );
  }
}

_textField(TextEditingController controller, String hintText) {
  return TextField(
    controller: controller,
    decoration: InputDecoration(
      fillColor: const Color(0xfff4edff),
      filled: true,
      hintText: hintText,
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide(width: 1, color: Colors.grey),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        borderSide: BorderSide(width: 1, color: Colors.grey),
      ),
    ),
  );
}
