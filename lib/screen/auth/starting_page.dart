import 'package:flutter/material.dart';
import 'package:stac_flutter/screen/auth/sign_up_page.dart';
import 'package:stac_flutter/screen/auth/sing_in_page.dart';

class StartingPage extends StatefulWidget {
  const StartingPage({Key? key}) : super(key: key);

  @override
  State<StartingPage> createState() => _StartingPageState();
}

class _StartingPageState extends State<StartingPage> {
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
      backgroundColor: const Color(0xff5c80d6),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 7,
            child: Container(
              color: Color(0xff5c80d6),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: Image.asset(
                    "assets/images/applogo.png",
                    height: MediaQuery.of(context).size.width * 0.8,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 100),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 60,
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xff3b56d5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(99),
                        ),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SignUpPage()));
                      },
                      child: Text(
                        "바로 시작하기",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  TextButton(
                    onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => SignInPage())),
                    child: Text(
                      "이미 계정이 있으신가요? 로그인하기",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
