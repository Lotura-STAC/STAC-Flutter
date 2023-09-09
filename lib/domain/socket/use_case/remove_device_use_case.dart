import 'package:stac_flutter/data/socket/dto/request/remove_device_request.dart';
import 'package:stac_flutter/domain/socket/repository/socket_repository.dart';

class RemoveDeviceUseCase {
  final SocketRepository _repository;

  RemoveDeviceUseCase({required SocketRepository repository})
      : _repository = repository;

  void execute(RemoveDeviceRequest removeDeviceRequest) {
    _repository.removeDevice(removeDeviceRequest);
  }
}
