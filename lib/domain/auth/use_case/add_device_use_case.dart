import 'package:stac_flutter/data/dto/auth/request/add_device_request.dart';
import 'package:stac_flutter/domain/auth/repository/socket_repository.dart';

class AddDeviceUseCase {
  final SocketRepository _repository;

  AddDeviceUseCase({required SocketRepository repository})
      : _repository = repository;

  void execute(AddDeviceRequest addDeviceRequest, String deviceName) async {
    _repository.addDevice(addDeviceRequest, deviceName);
  }
}
