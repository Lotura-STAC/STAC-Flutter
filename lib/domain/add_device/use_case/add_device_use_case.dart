import 'package:stac_flutter/data/add_device/dto/request/add_device_request.dart';
import 'package:stac_flutter/data/socket/dto/request/get_user_device_list_request.dart';
import 'package:stac_flutter/domain/add_device/repository/add_device_repository.dart';
import 'package:stac_flutter/domain/socket/repository/socket_repository.dart';

class AddDeviceUseCase {
  final AddDeviceRepository _addDeviceRepository;
  final SocketRepository _socketRepository;

  AddDeviceUseCase(
      {required AddDeviceRepository addDeviceRepository,
      required SocketRepository socketRepository})
      : _addDeviceRepository = addDeviceRepository,
        _socketRepository = socketRepository;

  Future<bool> execute(AddDeviceRequest addDeviceRequest) async {
    return await _addDeviceRepository.addDevice(addDeviceRequest);
  }
}
