import 'package:design_system/bottom_sheet/lotura_bottom_sheet.dart';
import 'package:design_system/button/lotura_icon_button.dart';
import 'package:design_system/color/lotura_color.dart';
import 'package:design_system/list_tile/lotura_list_tile.dart';
import 'package:design_system/message_box/lotura_message_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stac_flutter/data/remove_device/dto/remove_device_request.dart';
import 'package:stac_flutter/data/socket/dto/request/get_user_device_list_request.dart';
import 'package:stac_flutter/presentation/add_device/ui/add_device_page.dart';
import 'package:stac_flutter/presentation/main/bloc/main_bloc.dart';
import 'package:stac_flutter/presentation/main/bloc/main_event.dart';
import 'package:stac_flutter/presentation/main/bloc/main_state.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

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
            onPressed: () {},
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
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => const AddDevicePage()),
                  ),
                );
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
                              onPressed: () => showModalBottomSheet(
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(25.0))),
                                context: (context),
                                builder: (context) => LoturaBottomSheet(
                                    subtitle: "장치 설정하기",
                                    title: "장치에 변경사항이 생겼나요?",
                                    leftText: "장치 수정하기",
                                    rightText: "장치 삭제하기",
                                    onLeftPressed: () => print("장치 수정하기"),
                                    onRightPressed: () {
                                      Navigator.of(context).pop();
                                      context
                                          .read<MainBloc>()
                                          .add(RemoveDeviceEvent(
                                            removeDeviceRequest:
                                                RemoveDeviceRequest(
                                              deviceNo: state
                                                  .list.list[index].deviceNo,
                                            ),
                                          ));
                                    }),
                              ),
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
                      LoturaIconButton(
                        width: 375.0.r,
                        icon: Icon(
                          Icons.add,
                          color: LoturaColor.white,
                        ),
                        function: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => const AddDevicePage())),
                      ),
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
