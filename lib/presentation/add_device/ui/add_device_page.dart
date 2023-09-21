import 'package:design_system/button/lotura_text_button.dart';
import 'package:design_system/color/lotura_color.dart';
import 'package:design_system/text_field/lotura_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stac_flutter/data/add_device/dto/request/add_device_request.dart';
import 'package:stac_flutter/presentation/add_device/bloc/add_device_bloc.dart';
import 'package:stac_flutter/presentation/add_device/bloc/add_device_event.dart';
import 'package:stac_flutter/presentation/add_device/bloc/add_device_state.dart';

class AddDevicePage extends StatefulWidget {
  const AddDevicePage({super.key});

  @override
  State<AddDevicePage> createState() => _AddDevicePageState();
}

class _AddDevicePageState extends State<AddDevicePage> {
  final TextEditingController numController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddDeviceBloc, AddDeviceState>(
      listener: (context, state) {
        if (state is Loaded) {
          Navigator.of(context).pop();
          context.read<AddDeviceBloc>().add(AddDevicePageRefreshEvent());
        } else if (state is Error) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(state.message),
          ));
        }
      },
      child: Scaffold(
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
        body: BlocBuilder<AddDeviceBloc, AddDeviceState>(
          builder: (contex, state) {
            if (state is Empty || state is Error) {
              return SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(left: 24.0.r, right: 24.0.r),
                  child: Column(
                    children: [
                      SizedBox(height: 20.0.r),
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
                      SizedBox(height: 70.0.r),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          LoturaTextButton(
                            onPressed: () => setState(() => selectedIndex = 0),
                            color: LoturaColor.white,
                            width: 180.0.r,
                            text: Text(
                              "세탁기",
                              style: TextStyle(
                                  color: selectedIndex == 0
                                      ? LoturaColor.primary700
                                      : LoturaColor.gray200,
                                  fontSize: 20.0.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          LoturaTextButton(
                            onPressed: () => setState(() => selectedIndex = 1),
                            color: LoturaColor.white,
                            width: 180.0.r,
                            text: Text(
                              "건조기",
                              style: TextStyle(
                                  color: selectedIndex == 1
                                      ? LoturaColor.primary700
                                      : LoturaColor.gray200,
                                  fontSize: 20.0.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 80.0.r),
                      SizedBox(
                        width: 382.0.r,
                        child: LoturaTextField(
                          filteringTextInputFormatter:
                              FilteringTextInputFormatter.deny(
                                  RegExp('[^a-zA-Z0-9\\s]')),
                          controller: numController,
                          maxLength: 8,
                          hintText: "기기에 부착된 장치의 고유 번호를 입력해주세요.",
                          hintTextStyle: TextStyle(fontSize: 16.0.sp),
                        ),
                      ),
                      SizedBox(height: 35.0.r),
                      SizedBox(
                        width: 382.0.r,
                        child: LoturaTextField(
                          maxLength: 12,
                          controller: nameController,
                          hintText: "화면에 표시될 장치의 이름을 입력해주세요.",
                          hintTextStyle: TextStyle(
                            fontSize: 16.0.sp,
                          ),
                        ),
                      ),
                      SizedBox(height: 300.0.r),
                      LoturaTextButton(
                        onPressed: () {
                          context.read<AddDeviceBloc>().add(
                                AddDevice(
                                  addDeviceRequest: AddDeviceRequest(
                                    deviceNo: numController.text,
                                    name: nameController.text,
                                    deviceType:
                                        selectedIndex == 0 ? "WASH" : "DRY",
                                  ),
                                ),
                              );
                        },
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
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
