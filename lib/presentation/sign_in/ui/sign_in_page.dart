import 'package:design_system/button/lotura_text_button.dart';
import 'package:design_system/color/lotura_color.dart';
import 'package:design_system/text_field/lotura_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stac_flutter/data/auth/dto/request/sign_in_request.dart';
import 'package:stac_flutter/presentation/add_device/ui/add_device_page.dart';
import 'package:stac_flutter/presentation/main/ui/main_page.dart';
import 'package:stac_flutter/presentation/sign_in/bloc/sign_in_bloc.dart';
import 'package:stac_flutter/presentation/sign_in/bloc/sign_in_event.dart';
import 'package:stac_flutter/presentation/sign_in/bloc/sign_in_state.dart';
import 'package:stac_flutter/presentation/sign_up/ui/sign_up_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late final TextEditingController idController;
  late final TextEditingController pwdController;

  @override
  void initState() {
    idController = TextEditingController();
    pwdController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 24.0.r, right: 24.0.r),
        child: BlocListener<SignInBloc, SignInState>(
          listener: (context, state) {
            if (state is Loaded) {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const MainPage()),
                  (route) => false);
            }
          },
          child: BlocBuilder<SignInBloc, SignInState>(
            builder: (context, state) {
              if (state is Error) {
                return Column(
                  children: [
                    SizedBox(height: 145.0.r),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Lotura",
                        style: TextStyle(
                          color: LoturaColor.primary700,
                          fontSize: 50.0.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 82.0.r),
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
                    SizedBox(height: 70.0.r),
                    LoturaTextButton(
                      text: Text(
                        "로그인",
                        style: TextStyle(
                            color: LoturaColor.white,
                            fontSize: 16.0.sp,
                            fontWeight: FontWeight.w700),
                      ),
                      onPressed: () => context.read<SignInBloc>().add(
                            SignIn(
                              signInRequest: SignInRequest(
                                  id: idController.text,
                                  pw: pwdController.text),
                            ),
                          ),
                    ),
                    SizedBox(height: 20.0.r),
                    GestureDetector(
                      onTap: () => Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => const SignUpPage()),
                          (route) => false),
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Lotura가 처음이신가요? ',
                              style: TextStyle(
                                color: LoturaColor.gray500,
                                fontSize: 16.0.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: '회원가입',
                              style: TextStyle(
                                color: LoturaColor.primary700,
                                fontSize: 16.0.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: '하기',
                              style: TextStyle(
                                color: LoturaColor.gray500,
                                fontSize: 16.0.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                );
              }
              if (state is Loading) {
                const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is Empty) {
                return Column(
                  children: [
                    SizedBox(height: 145.0.r),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Lotura",
                        style: TextStyle(
                          color: LoturaColor.primary700,
                          fontSize: 50.0.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 82.0.r),
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
                    SizedBox(height: 70.0.r),
                    LoturaTextButton(
                      text: Text(
                        "로그인",
                        style: TextStyle(
                            color: LoturaColor.white,
                            fontSize: 16.0.sp,
                            fontWeight: FontWeight.w700),
                      ),
                      onPressed: () => context.read<SignInBloc>().add(
                            SignIn(
                              signInRequest: SignInRequest(
                                  id: idController.text,
                                  pw: pwdController.text),
                            ),
                          ),
                    ),
                    SizedBox(height: 20.0.r),
                    GestureDetector(
                      onTap: () => Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => const SignUpPage()),
                          (route) => false),
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Lotura가 처음이신가요? ',
                              style: TextStyle(
                                color: LoturaColor.gray500,
                                fontSize: 16.0.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: '회원가입',
                              style: TextStyle(
                                color: LoturaColor.primary700,
                                fontSize: 16.0.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: '하기',
                              style: TextStyle(
                                color: LoturaColor.gray500,
                                fontSize: 16.0.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
