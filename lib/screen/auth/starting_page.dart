import 'package:flutter/material.dart';
import 'package:stac_flutter/common/common.dart';
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

  int screenState = 0;

  //1이면 회원가입, 2면 로그인

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
      backgroundColor: CustomColor.logoImageBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: screenState == 0 ? 7 : 4,
            child: Container(
              color: CustomColor.logoImageBackgroundColor,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: Image.asset(
                    "assets/images/applogo.png",
                    height: MediaQuery.of(context).size.width * 0.75,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: screenState == 0 ? 4 : 6,
            child: screenState == 0
                ? Container(
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
                        SizedBox(height: 90),
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 60,
                          height: MediaQuery.of(context).size.height * 0.06,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: CustomColor.pointColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(99),
                              ),
                            ),
                            onPressed: () {
                              setState(() {
                                screenState = 1;
                              });
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
                              MaterialPageRoute(
                                  builder: (context) => SignInPage())),
                          child: Text(
                            "이미 계정이 있으신가요? 로그인하기",
                            style: TextStyle(fontSize: 18, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  )
                : screenState == 1
                    ? Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                      )
                    : Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                      ),
          ),
        ],
      ),
    );
  }
}
