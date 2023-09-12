import 'package:stac_flutter/data/remove_device/dto/remove_device_request.dart';

abstract class RemoveDeviceRepository {
  Future<bool> removeDevice(RemoveDeviceRequest removeDeviceRequest);
}
