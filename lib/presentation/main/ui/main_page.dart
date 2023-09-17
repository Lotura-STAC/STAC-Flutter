import 'package:design_system/bottom_sheet/lotura_bottom_sheet.dart';
import 'package:design_system/button/lotura_icon_button.dart';
import 'package:design_system/color/lotura_color.dart';
import 'package:design_system/dialog/lotura_dialog.dart';
import 'package:design_system/list_tile/lotura_list_tile.dart';
import 'package:design_system/message_box/lotura_message_box.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stac_flutter/data/auth/dto/response/sign_in_response.dart';
import 'package:stac_flutter/data/notify/dto/request/notify_request.dart';
import 'package:stac_flutter/data/remove_device/dto/remove_device_request.dart';
import 'package:stac_flutter/data/socket/dto/request/get_user_device_list_request.dart';
import 'package:stac_flutter/presentation/add_device/ui/add_device_page.dart';
import 'package:stac_flutter/presentation/main/bloc/main_bloc.dart';
import 'package:stac_flutter/presentation/main/bloc/main_event.dart';
import 'package:stac_flutter/presentation/main/bloc/main_state.dart';
import 'package:stac_flutter/presentation/modify_device/ui/modify_device_page.dart';
import 'package:stac_flutter/presentation/setting/setting_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.role});

  final Role role;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
    context.read<MainBloc>().add(GetUserDeviceListEvent(
        getUserDeviceListRequest: GetUserDeviceListRequest(accessToken: "")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LoturaColor.gray100,
      appBar: AppBar(
        backgroundColor: LoturaColor.gray100,
        elevation: 0.0,
        leadingWidth: 200.0.w,
        leading: Padding(
          padding: EdgeInsets.only(left: 40.0.r, top: 8.0.r),
          child: Text(
            "Lotura",
            style: TextStyle(
              fontSize: 28.0.sp,
              fontWeight: FontWeight.w700,
              color: LoturaColor.primary700,
            ),
          ),
        ),
        actions: [
          IconButton(
            padding: EdgeInsets.only(right: 30.0.r),
            onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const SettingPage())),
            icon: Icon(
              Icons.settings,
              color: LoturaColor.black,
            ),
          ),
          SizedBox(width: 12.0.r),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 24.0.r, right: 24.0.r),
        child: BlocBuilder<MainBloc, MainState>(
          builder: (context, state) {
            if (state is Loading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is Loaded) {
              if (state.list.list.isEmpty) {
                return LoturaMessageBox(
                    margin: EdgeInsets.only(top: 100.0.r),
                    onPressed: () => widget.role == Role.admin
                        ? Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const AddDevicePage()),
                          )
                        : null);
              } else {
                return Padding(
                  padding: EdgeInsets.only(bottom: 40.0.r),
                  child: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: state.list.list.length,
                          itemBuilder: (context, index) {
                            return LoturaListTile(
                              onLongPressed: () => showDialog(
                                  context: context,
                                  builder: (context) => LoturaDialog(
                                      title: Text("알림 신청하시겠습니까?"),
                                      content: Text(
                                        state.list.list[index].name,
                                        style: TextStyle(fontSize: 20.0.sp),
                                      ),
                                      onPressed: () {
                                        String token = "";
                                        () async {
                                          token = await FirebaseMessaging
                                                  .instance
                                                  .getToken() ??
                                              "";
                                        };
                                        context
                                            .read<MainBloc>()
                                            .add(NotifyEvent(
                                              notifyRequest: NotifyRequest(
                                                  deviceToken: token.toString(),
                                                  deviceNo: state.list
                                                      .list[index].deviceNo),
                                            ));
                                        Navigator.pop(context);
                                      })),
                              onPressed: () => widget.role == Role.admin
                                  ? showModalBottomSheet(
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(25.0))),
                                      context: (context),
                                      builder: (context) => LoturaBottomSheet(
                                          subtitle: "장치 설정하기",
                                          title: "장치에 변경사항이 생겼나요?",
                                          leftText: "이름 수정하기",
                                          rightText: "장치 삭제하기",
                                          onLeftPressed: () {
                                            Navigator.of(context).pop();
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ModifyDevicePage(
                                                  selectedIndex: state
                                                              .list
                                                              .list[index]
                                                              .deviceType ==
                                                          "DRY"
                                                      ? 1
                                                      : 0,
                                                  deviceName: state
                                                      .list.list[index].name,
                                                  deviceNum: state.list
                                                      .list[index].deviceNo,
                                                ),
                                              ),
                                            );
                                          },
                                          onRightPressed: () {
                                            Navigator.of(context).pop();
                                            context
                                                .read<MainBloc>()
                                                .add(RemoveDeviceEvent(
                                                  removeDeviceRequest:
                                                      RemoveDeviceRequest(
                                                    deviceNo: state.list
                                                        .list[index].deviceNo,
                                                  ),
                                                ));
                                          }),
                                    )
                                  : null,
                              width: 382.0.r,
                              height: 78.0.r,
                              deviceType: state.list.list[index].deviceType,
                              text: state.list.list[index].name,
                              status: state.list.list[index].currStatus,
                              margin: EdgeInsets.all(8.0.r),
                            );
                          },
                        ),
                      ),
                      widget.role == Role.admin
                          ? LoturaIconButton(
                              width: 375.0.r,
                              icon: Icon(
                                Icons.add,
                                color: LoturaColor.white,
                              ),
                              function: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const AddDevicePage())),
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                );
              }
            }
            return Container();
          },
        ),
      ),
    );
  }
}
