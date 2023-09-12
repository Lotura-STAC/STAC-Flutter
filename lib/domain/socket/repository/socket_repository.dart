import 'package:stac_flutter/data/socket/dto/request/get_user_device_list_request.dart';
import 'package:stac_flutter/data/socket/dto/response/get_user_device_list_response.dart';

abstract class SocketRepository {
  Stream<GetUserDeviceListResponse> get userDeviceList;

  void getUserDeviceList(GetUserDeviceListRequest getUserDeviceListRequest);
}
