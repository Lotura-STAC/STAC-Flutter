import 'package:stac_flutter/data/dto/auth/response/get_user_device_list_response.dart';

abstract class SocketRepository {
  Stream<GetUserDeviceListResponse> get applyStream;

  void addDevice();

  void removeDevice();

  void getUserDeviceList();
}
