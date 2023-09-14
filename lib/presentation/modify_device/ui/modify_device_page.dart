import 'package:design_system/button/lotura_text_button.dart';
import 'package:design_system/color/lotura_color.dart';
import 'package:design_system/text_field/lotura_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stac_flutter/data/add_device/dto/request/add_device_request.dart';
import 'package:stac_flutter/data/modify_device/dto/request/modify_device_request.dart';
import 'package:stac_flutter/data/socket/dto/request/get_user_device_list_request.dart';
import 'package:stac_flutter/presentation/add_device/bloc/add_device_bloc.dart';
import 'package:stac_flutter/presentation/add_device/bloc/add_device_event.dart';
import 'package:stac_flutter/presentation/add_device/bloc/add_device_state.dart';
import 'package:stac_flutter/presentation/main/bloc/main_bloc.dart';
import 'package:stac_flutter/presentation/main/bloc/main_event.dart';
import 'package:stac_flutter/presentation/modify_device/bloc/modify_device_bloc.dart';
import 'package:stac_flutter/presentation/modify_device/bloc/modify_device_event.dart';

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
      body: Padding(
        padding: EdgeInsets.only(left: 24.0.r, right: 24.0.r),
        child: Column(
          children: [
            SizedBox(height: 20.0.r),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "기기수정을 위한\n새로운 이름을 입력해주세요.",
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
                Text(
                  "세탁기",
                  style: TextStyle(
                      color: widget.selectedIndex == 0
                          ? LoturaColor.black
                          : LoturaColor.gray200,
                      fontSize: 20.0.sp),
                ),
                Text(
                  "건조기",
                  style: TextStyle(
                      color: widget.selectedIndex == 1
                          ? LoturaColor.black
                          : LoturaColor.gray200,
                      fontSize: 20.0.sp),
                ),
              ],
            ),
            SizedBox(height: 40.0.r),
            SizedBox(
              width: 382.0.r,
              child: Row(
                children: [
                  Text(
                    "현재 수정할 기기의 고유번호 : ",
                    style: TextStyle(
                      fontSize: 18.0.sp,
                    ),
                  ),
                  Text(
                    widget.deviceNum,
                    style: TextStyle(
                      fontSize: 24.0.sp,
                    ),
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
            SizedBox(height: 330.0.r),
            BlocListener<AddDeviceBloc, AddDeviceState>(
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
                  Future.delayed(const Duration(milliseconds: 300))
                      .then((value) {
                    context.read<MainBloc>().add(GetUserDeviceListEvent(
                        getUserDeviceListRequest:
                            GetUserDeviceListRequest(accessToken: "")));
                  });
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
    );
  }
}
