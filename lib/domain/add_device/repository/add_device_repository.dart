import 'package:stac_flutter/data/add_device/dto/request/add_device_request.dart';

abstract class AddDeviceRepository {
  Future<bool> addDevice(AddDeviceRequest addDeviceRequest);
}
