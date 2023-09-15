import 'package:design_system/color/lotura_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stac_flutter/core/utils/jwt_store.dart';
import 'package:stac_flutter/presentation/sign_in/bloc/sign_in_bloc.dart';
import 'package:stac_flutter/presentation/sign_in/bloc/sign_in_event.dart';
import 'package:stac_flutter/presentation/sign_in/ui/sign_in_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LoturaColor.gray100,
      appBar: AppBar(
        backgroundColor: LoturaColor.gray100,
        elevation: 0.0,
        leadingWidth: 300.0.w,
        leading: Row(
          children: [
            IconButton(
              padding: EdgeInsets.only(left: 24.0.w, right: 12.0.w),
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.arrow_back,
                color: LoturaColor.black,
                size: 24.0.r,
              ),
            ),
            Text(
              "설정",
              style: TextStyle(fontSize: 24.0.sp, color: LoturaColor.black),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: 24.0.w,
          right: 24.0.w,
          top: 12.0.h,
          bottom: 12.0.h,
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(12.0.r),
              child: GestureDetector(
                onTap: () async {
                  await launchUrl(
                      Uri.parse("https://open.kakao.com/o/sot912Gf"),
                      mode: LaunchMode.externalApplication);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "문의하기",
                      style: TextStyle(fontSize: 16.0.sp),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: LoturaColor.gray300,
                      size: 24.0.r,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 12.0.h),
            Padding(
              padding: EdgeInsets.all(12.0.r),
              child: GestureDetector(
                onTap: () async {
                  JWTStore.deleteAll();
                  context.read<SignInBloc>().add(ResetEvent());
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignInPage()),
                      (route) => false);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "로그아웃",
                      style: TextStyle(fontSize: 16.0.sp),
                    ),
                    Icon(
                      Icons.keyboard_arrow_right,
                      color: LoturaColor.gray300,
                      size: 24.0.r,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
