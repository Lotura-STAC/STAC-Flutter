import 'package:stac_flutter/data/remove_device/dto/remove_device_request.dart';
import 'package:stac_flutter/domain/remove_device/repository/remove_device_repository.dart';

class RemoveDeviceUseCase {
  final RemoveDeviceRepository _removeDeviceRepository;

  RemoveDeviceUseCase({required RemoveDeviceRepository removeDeviceRepository})
      : _removeDeviceRepository = removeDeviceRepository;

  Future<bool> execute(RemoveDeviceRequest removeDeviceRequest) async {
    return await _removeDeviceRepository.removeDevice(removeDeviceRequest);
  }
}
