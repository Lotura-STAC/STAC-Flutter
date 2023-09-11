import 'package:stac_flutter/data/socket/dto/request/add_device_request.dart';
import 'package:stac_flutter/data/socket/dto/request/get_user_device_list_request.dart';
import 'package:stac_flutter/domain/socket/repository/socket_repository.dart';

class AddDeviceUseCase {
  final SocketRepository _repository;

  AddDeviceUseCase({required SocketRepository repository})
      : _repository = repository;

  void execute(AddDeviceRequest addDeviceRequest) {
    _repository.addDevice(addDeviceRequest);
    Future.delayed(const Duration(milliseconds: 500)).then((value) {
      _repository.getUserDeviceList(
          GetUserDeviceListRequest(userId: "", accessToken: ""));
    });
  }
}
