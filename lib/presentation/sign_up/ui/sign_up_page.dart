import 'package:design_system/button/lotura_text_button.dart';
import 'package:design_system/color/lotura_color.dart';
import 'package:design_system/text_field/lotura_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stac_flutter/data/auth/dto/request/sign_up_request.dart';
import 'package:stac_flutter/presentation/sign_in/ui/sign_in_page.dart';
import 'package:stac_flutter/presentation/sign_up/bloc/sign_up_bloc.dart';
import 'package:stac_flutter/presentation/sign_up/bloc/sign_up_event.dart';
import 'package:stac_flutter/presentation/sign_up/bloc/sign_up_state.dart';
import 'package:stac_flutter/presentation/sign_up/ui/public_sign_up_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late final TextEditingController idController;
  late final TextEditingController pwdController;
  late final TextEditingController pwdCheckController;

  @override
  void initState() {
    super.initState();
    idController = TextEditingController();
    pwdController = TextEditingController();
    pwdCheckController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LoturaColor.gray100,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: LoturaColor.gray100,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.arrow_back,
            color: LoturaColor.black,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: 24.0.r,
          right: 24.0.r,
        ),
        child: BlocListener<SignUpBloc, SignUpState>(
          listener: (context, state) {
            if (state is Loaded) {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const SignInPage()),
                  (route) => false);
            }
          },
          child: Column(
            children: [
              SizedBox(height: 30.0.r),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "회원가입을 위한\n정보를 입력해주세요.",
                  style: TextStyle(
                    color: LoturaColor.black,
                    fontSize: 30.0.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 67.0.r),
              SizedBox(
                width: 382.0.r,
                child: LoturaTextField(
                  controller: idController,
                  hintText: "아이디를 입력해주세요",
                  hintTextStyle: TextStyle(fontSize: 16.0.sp),
                ),
              ),
              SizedBox(height: 35.0.r),
              SizedBox(
                width: 382.0.r,
                child: LoturaTextField(
                  controller: pwdController,
                  isPasswordTextField: true,
                  hintText: "비밀번호를 입력해주세요",
                  hintTextStyle: TextStyle(
                    fontSize: 16.0.sp,
                  ),
                ),
              ),
              SizedBox(height: 35.0.r),
              SizedBox(
                width: 382.0.r,
                child: LoturaTextField(
                  controller: pwdCheckController,
                  isPasswordTextField: true,
                  hintText: "비밀번호를 확인해주세요",
                  hintTextStyle: TextStyle(
                    fontSize: 16.0.sp,
                  ),
                ),
              ),
              SizedBox(height: 70.0.r),
              LoturaTextButton(
                text: Text(
                  "회원가입",
                  style: TextStyle(
                      color: LoturaColor.white,
                      fontSize: 16.0.sp,
                      fontWeight: FontWeight.w700),
                ),
                onPressed: () => context.read<SignUpBloc>().add(
                      SignUp(
                        signUpRequest: SignUpRequest(
                            id: idController.text, pw: pwdController.text),
                      ),
                    ),
              ),
              SizedBox(height: 20.0.r),
              GestureDetector(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const PublicSignUpPage())),
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '공용시설에서 사용하나요? ',
                        style: TextStyle(
                          color: LoturaColor.gray500,
                          fontSize: 16.0.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: '공용계정',
                        style: TextStyle(
                          color: LoturaColor.primary700,
                          fontSize: 16.0.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextSpan(
                        text: '만들기',
                        style: TextStyle(
                          color: LoturaColor.gray500,
                          fontSize: 16.0.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
