import 'package:design_system/color/lotura_color.dart';
import 'package:design_system/list_tile/lotura_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        getUserDeviceListRequest:
            GetUserDeviceListRequest(accessToken: "", userId: "")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LoturaColor.gray100,
      appBar: AppBar(
        backgroundColor: LoturaColor.gray100,
        elevation: 0.0,
        actions: [
          IconButton(
            padding: EdgeInsets.only(right: 30.0.r),
            onPressed: () {},
            icon: Icon(
              Icons.settings,
              color: LoturaColor.black,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 24.0.r, right: 24.0.r),
        child: Center(
          child: BlocBuilder<MainBloc, MainState>(
            builder: (context, state) {
              if (state is Loading) {
                return const CircularProgressIndicator();
              }
              if (state is Loaded) {
                if (state.list.list.isEmpty) {
                  Container();
                } else {
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: ListView.builder(
                      itemCount: state.list.list.length,
                      itemBuilder: (context, index) {
                        return LoturaListTile(
                          width: 382.0.r,
                          height: 78.0.r,
                          deviceType: state.list.list[index].deviceType,
                          text: state.list.list[index].name,
                          status: state.list.list[index].currStatus,
                          margin: EdgeInsets.all(8.0.r),
                        );
                      },
                    ),
                  );
                }
              }
              return Container();
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const AddDevicePage())),
        child: const Icon(Icons.add),
      ),
    );
  }
}
