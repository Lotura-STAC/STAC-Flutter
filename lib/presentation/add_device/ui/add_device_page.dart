import 'package:design_system/button/lotura_text_button.dart';
import 'package:design_system/color/lotura_color.dart';
import 'package:design_system/text_field/lotura_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddDevicePage extends StatefulWidget {
  const AddDevicePage({super.key});

  @override
  State<AddDevicePage> createState() => _AddDevicePageState();
}

class _AddDevicePageState extends State<AddDevicePage> {
  late final TextEditingController numController;
  late final TextEditingController nameController;

  @override
  void initState() {
    numController = TextEditingController();
    nameController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LoturaColor.gray100,
      appBar: AppBar(
        backgroundColor: LoturaColor.gray100,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.arrow_back,
            color: LoturaColor.black,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 24.0.r, right: 24.0.r),
        child: Column(
          children: [
            SizedBox(height: 49.0.r),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "기기등록을 위한\n정보를 입력해주세요.",
                style: TextStyle(
                  color: LoturaColor.black,
                  fontSize: 30.0.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 82.0.r),
            SizedBox(
              width: 382.0.r,
              child: LoturaTextField(
                controller: numController,
                hintText: "기기에 부착할 장치의 고유 번호를 입력해주세요.",
                hintTextStyle: TextStyle(fontSize: 16.0.sp),
              ),
            ),
            SizedBox(height: 35.0.r),
            SizedBox(
              width: 382.0.r,
              child: LoturaTextField(
                controller: nameController,
                hintText: "화면에 표시될 기기의 이름을 입력해주세요.",
                hintTextStyle: TextStyle(
                  fontSize: 16.0.sp,
                ),
              ),
            ),
            SizedBox(height: 380.0.r),
            LoturaTextButton(
              text: Text(
                "확인",
                style: TextStyle(
                    color: LoturaColor.white,
                    fontSize: 16.0.sp,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
