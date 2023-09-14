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

class PublicSignUpPage extends StatefulWidget {
  const PublicSignUpPage({super.key});

  @override
  State<PublicSignUpPage> createState() => _PublicSignUpPageState();
}

class _PublicSignUpPageState extends State<PublicSignUpPage> {
  late final TextEditingController adminIdController,
      adminPwdController,
      adminPwdCheckController,
      guestIdController,
      guestPwdController,
      guestPwdCheckController;

  @override
  void initState() {
    super.initState();
    adminIdController = TextEditingController();
    adminPwdController = TextEditingController();
    adminPwdCheckController = TextEditingController();
    guestIdController = TextEditingController();
    guestPwdController = TextEditingController();
    guestPwdCheckController = TextEditingController();
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
                  "공용 계정 사용을 위한\n정보를 입력해주세요.",
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
                  controller: adminIdController,
                  hintText: "관리자 아이디를 입력해주세요",
                  hintTextStyle: TextStyle(fontSize: 16.0.sp),
                ),
              ),
              SizedBox(height: 35.0.r),
              SizedBox(
                width: 382.0.r,
                child: LoturaTextField(
                  controller: adminPwdController,
                  isPasswordTextField: true,
                  hintText: "관리자 비밀번호를 입력해주세요",
                  hintTextStyle: TextStyle(
                    fontSize: 16.0.sp,
                  ),
                ),
              ),
              SizedBox(height: 35.0.r),
              SizedBox(
                width: 382.0.r,
                child: LoturaTextField(
                  controller: adminPwdCheckController,
                  isPasswordTextField: true,
                  hintText: "관리자 비밀번호를 확인해주세요",
                  hintTextStyle: TextStyle(
                    fontSize: 16.0.sp,
                  ),
                ),
              ),
              SizedBox(height: 35.0.r),
              SizedBox(
                width: 382.0.r,
                child: LoturaTextField(
                  controller: guestIdController,
                  isPasswordTextField: false,
                  hintText: "공용 계정 아이디를 입력해주세요",
                  hintTextStyle: TextStyle(
                    fontSize: 16.0.sp,
                  ),
                ),
              ),
              SizedBox(height: 35.0.r),
              SizedBox(
                width: 382.0.r,
                child: LoturaTextField(
                  controller: guestPwdController,
                  isPasswordTextField: true,
                  hintText: "공용 계정 비밀번호를 입력해주세요",
                  hintTextStyle: TextStyle(
                    fontSize: 16.0.sp,
                  ),
                ),
              ),
              SizedBox(height: 35.0.r),
              SizedBox(
                width: 382.0.r,
                child: LoturaTextField(
                  controller: guestPwdCheckController,
                  isPasswordTextField: true,
                  hintText: "공용 계정 비밀번호를 확인해주세요",
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
                            adminId: adminIdController.text,
                            adminPw: adminPwdController.text,
                            guestId: guestIdController.text,
                            guestPw: guestPwdCheckController.text),
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
