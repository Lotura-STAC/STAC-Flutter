import 'package:stac_flutter/data/add_device/dto/request/add_device_request.dart';
import 'package:stac_flutter/domain/add_device/repository/add_device_repository.dart';

class AddDeviceUseCase {
  final AddDeviceRepository _addDeviceRepository;

  AddDeviceUseCase({required AddDeviceRepository addDeviceRepository})
      : _addDeviceRepository = addDeviceRepository;

  Future<bool> execute(AddDeviceRequest addDeviceRequest) async {
    return await _addDeviceRepository.addDevice(addDeviceRequest);
  }
}
