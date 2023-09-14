import 'package:stac_flutter/data/modify_device/dto/request/modify_device_request.dart';

abstract class ModifyDeviceRepository {
  Future<bool> modifyDevice(ModifyDeviceRequest modifyDeviceRequest);
}
