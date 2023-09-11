import 'package:stac_flutter/data/socket/dto/request/add_device_request.dart';
import 'package:stac_flutter/data/socket/dto/request/get_user_device_list_request.dart';
import 'package:stac_flutter/data/socket/dto/request/remove_device_request.dart';
import 'package:stac_flutter/data/socket/dto/request/socket_login_request.dart';
import 'package:stac_flutter/data/socket/dto/response/get_user_device_list_response.dart';

abstract class SocketRepository {
  Stream<GetUserDeviceListResponse> get userDeviceList;

  void addDevice(AddDeviceRequest addDeviceRequest);

  void removeDevice(RemoveDeviceRequest removeDeviceRequest);

  void getUserDeviceList(GetUserDeviceListRequest getUserDeviceListRequest);
}
