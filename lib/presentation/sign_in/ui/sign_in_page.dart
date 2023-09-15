import 'package:design_system/button/lotura_text_button.dart';
import 'package:design_system/check_box/loutra_check_box.dart';
import 'package:design_system/color/lotura_color.dart';
import 'package:design_system/text_field/lotura_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:stac_flutter/data/auth/dto/request/sign_in_request.dart';
import 'package:stac_flutter/presentation/main/ui/main_page.dart';
import 'package:stac_flutter/presentation/sign_in/bloc/sign_in_bloc.dart';
import 'package:stac_flutter/presentation/sign_in/bloc/sign_in_event.dart';
import 'package:stac_flutter/presentation/sign_in/bloc/sign_in_state.dart';
import 'package:stac_flutter/presentation/sign_up/ui/sign_up_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key, this.secondSelected});

  final bool? secondSelected;

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController idController = TextEditingController();
  final TextEditingController pwdController = TextEditingController();
  final _storage = const FlutterSecureStorage();
  int buildCount = 0;
  bool firstSelected = false, secondSelected = false;

  _asyncMethod() async {
    dynamic autoLogin = '', saveId = '';
    saveId = await _storage.read(key: 'saveId');
    autoLogin = await _storage.read(key: 'autoLogin');
    if (saveId != null) {
      idController.text = saveId;
      secondSelected = true;
    }
    if (autoLogin != null) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const MainPage()));
    }
  }

  @override
  void dispose() {
    super.dispose();
    buildCount = 0;
  }

  @override
  Widget build(BuildContext context) {
    if (buildCount == 0) {
      _asyncMethod();
      setState(() {
        if (widget.secondSelected == true) {
          setState(() {
            secondSelected = true;
            buildCount = 1;
          });
        }
      });
      print(widget.secondSelected);
    }
    return Scaffold(
      backgroundColor: LoturaColor.gray100,
      body: Padding(
        padding: EdgeInsets.only(left: 24.0.r, right: 24.0.r),
        child: BlocListener<SignInBloc, SignInState>(
          listener: (context, state) async {
            if (state is Loaded) {
              if (firstSelected == true) {
                await _storage.write(key: 'autoLogin', value: 'true');
              }
              if (secondSelected == true) {
                await _storage.write(key: 'saveId', value: idController.text);
              } else {
                await _storage.delete(key: 'saveId');
              }
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
                    SizedBox(height: 20.0.r),
                    Row(
                      children: [
                        LoturaCheckBox(
                          isSelected: firstSelected,
                          onPressed: () =>
                              setState(() => firstSelected = !firstSelected),
                        ),
                        SizedBox(width: 8.0.r),
                        Text(
                          "자동 로그인",
                          style: TextStyle(
                              fontSize: 15.0.sp, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(width: 20.0.r),
                        LoturaCheckBox(
                          isSelected: secondSelected,
                          onPressed: () =>
                              setState(() => secondSelected = !secondSelected),
                        ),
                        SizedBox(width: 8.0.r),
                        Text(
                          "아이디 저장",
                          style: TextStyle(
                              fontSize: 15.0.sp, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    SizedBox(height: 60.0.r),
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
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SignUpPage())),
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
                    SizedBox(height: 20.0.r),
                    Row(
                      children: [
                        LoturaCheckBox(
                          isSelected: firstSelected,
                          onPressed: () =>
                              setState(() => firstSelected = !firstSelected),
                        ),
                        SizedBox(width: 8.0.r),
                        Text(
                          "자동 로그인",
                          style: TextStyle(
                              fontSize: 15.0.sp, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(width: 20.0.r),
                        LoturaCheckBox(
                          isSelected: secondSelected,
                          onPressed: () =>
                              setState(() => secondSelected = !secondSelected),
                        ),
                        SizedBox(width: 8.0.r),
                        Text(
                          "아이디 저장",
                          style: TextStyle(
                              fontSize: 15.0.sp, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    SizedBox(height: 60.0.r),
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
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SignUpPage())),
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
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
