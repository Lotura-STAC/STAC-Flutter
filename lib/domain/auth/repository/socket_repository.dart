import 'package:stac_flutter/data/dto/auth/request/add_device_request.dart';
import 'package:stac_flutter/data/dto/auth/request/get_user_device_list_request.dart';
import 'package:stac_flutter/data/dto/auth/request/remove_device_request.dart';
import 'package:stac_flutter/data/dto/auth/response/get_user_device_list_response.dart';

abstract class SocketRepository {
  Stream<GetUserDeviceListResponse> get userDeviceListStream;

  void addDevice(AddDeviceRequest addDeviceRequest);

  void removeDevice(RemoveDeviceRequest removeDeviceRequest);

  void getUserDeviceList(GetUserDeviceListRequest getUserDeviceListRequest);
}
