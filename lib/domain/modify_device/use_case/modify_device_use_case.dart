import 'package:stac_flutter/data/modify_device/dto/request/modify_device_request.dart';
import 'package:stac_flutter/domain/modify_device/repository/modify_device_repository.dart';

class ModifyDeviceUseCase {
  final ModifyDeviceRepository _modifyDeviceRepository;

  ModifyDeviceUseCase({required ModifyDeviceRepository modifyDeviceRepository})
      : _modifyDeviceRepository = modifyDeviceRepository;

  Future<bool> modifyDevice(ModifyDeviceRequest modifyDeviceRequest) async {
    return await _modifyDeviceRepository.modifyDevice(modifyDeviceRequest);
  }
}
