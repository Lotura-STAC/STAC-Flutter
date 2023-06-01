import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late TextEditingController idController;
  late TextEditingController pwdController;
  late TextEditingController pwdCheckController;
  FocusNode firstFocusNode = FocusNode();
  FocusNode secondFocusNode = FocusNode();
  FocusNode thirdFocusNode = FocusNode();

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
          SizedBox(height: 100),
          _textField(
              controller: idController,
              hintText: "아이디를 입력해주세요",
              context: context,
              focusNode: firstFocusNode,
              autofocus: true),
          const SizedBox(height: 20.0),
          _textField(
              controller: pwdController,
              hintText: "비밀번호를 입력해주세요",
              context: context,
              focusNode: secondFocusNode,
              autofocus: false),
          const SizedBox(height: 20.0),
          _textField(
              controller: pwdCheckController,
              hintText: "비밀번호를 확인해주세요",
              context: context,
              focusNode: thirdFocusNode,
              autofocus: false),
        ],
      ),
    );
  }
}

_textField(
    {TextEditingController? controller,
    String? hintText,
    BuildContext? context,
    FocusNode? focusNode,
    bool? autofocus}) {
  return Center(
    child: SizedBox(
      width: MediaQuery.of(context!).size.width - 40,
      child: TextField(
        focusNode: focusNode,
        autofocus: autofocus!,
        controller: controller,
        decoration: InputDecoration(
          fillColor: const Color(0xfff4edff),
          filled: true,
          hintText: hintText,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(width: 1, color: Colors.grey),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(width: 1, color: Colors.grey),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            borderSide: BorderSide(width: 1, color: Colors.grey),
          ),
        ),
      ),
    ),
  );
}
