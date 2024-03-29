import 'package:design_system/button/lotura_text_button.dart';
import 'package:design_system/color/lotura_color.dart';
import 'package:design_system/text_field/lotura_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stac_flutter/data/modify_device/dto/request/modify_device_request.dart';
import 'package:stac_flutter/presentation/modify_device/bloc/modify_device_bloc.dart';
import 'package:stac_flutter/presentation/modify_device/bloc/modify_device_event.dart';
import 'package:stac_flutter/presentation/modify_device/bloc/modify_device_state.dart';

class ModifyDevicePage extends StatefulWidget {
  const ModifyDevicePage({
    super.key,
    required this.selectedIndex,
    required this.deviceNum,
    required this.deviceName,
  });

  final int selectedIndex;
  final String deviceNum, deviceName;

  @override
  State<ModifyDevicePage> createState() => _ModifyDevicePageState();
}

class _ModifyDevicePageState extends State<ModifyDevicePage> {
  late final TextEditingController nameController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    nameController.text = widget.deviceName;
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 24.0.r, right: 24.0.r),
          child: Column(
            children: [
              SizedBox(height: 20.0.r),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "이 장치의\n새로운 이름을 입력해주세요.",
                  style: TextStyle(
                    color: LoturaColor.black,
                    fontSize: 30.0.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 70.0.r),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  LoturaTextButton(
                    color: LoturaColor.white,
                    width: 180.0.r,
                    text: Text(
                      "세탁기",
                      style: TextStyle(
                          color: widget.selectedIndex == 0
                              ? LoturaColor.primary700
                              : LoturaColor.gray200,
                          fontSize: 20.0.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  LoturaTextButton(
                    color: LoturaColor.white,
                    width: 180.0.r,
                    text: Text(
                      "건조기",
                      style: TextStyle(
                          color: widget.selectedIndex == 1
                              ? LoturaColor.primary700
                              : LoturaColor.gray200,
                          fontSize: 20.0.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40.0.r),
              SizedBox(
                width: 382.0.r,
                child: Row(
                  children: [
                    Text(
                      "고유번호 : ",
                      style: TextStyle(
                          fontSize: 20.0.sp, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.deviceNum,
                      style: TextStyle(
                          fontSize: 24.0.sp, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 35.0.r),
              SizedBox(
                width: 382.0.r,
                child: LoturaTextField(
                  controller: nameController,
                  hintText: "화면에 표시될 장치의 이름을 입력해주세요.",
                  hintTextStyle: TextStyle(
                    fontSize: 16.0.sp,
                  ),
                ),
              ),
              SizedBox(height: 370.0.r),
              BlocListener<ModifyDeviceBloc, ModifyDeviceState>(
                listener: (context, state) {
                  if (state is Loaded) {
                    Navigator.of(context).pop();
                  }
                },
                child: LoturaTextButton(
                  onPressed: () {
                    context.read<ModifyDeviceBloc>().add(
                          ModifyDevice(
                            modifyDeviceRequest: ModifyDeviceRequest(
                              deviceNo: widget.deviceNum,
                              newName: nameController.text,
                            ),
                          ),
                        );
                  },
                  text: Text(
                    "수정하기",
                    style: TextStyle(
                        color: LoturaColor.white,
                        fontSize: 16.0.sp,
                        fontWeight: FontWeight.w700),
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
