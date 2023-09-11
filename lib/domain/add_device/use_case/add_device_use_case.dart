import 'package:stac_flutter/data/add_device/dto/request/add_device_request.dart';
import 'package:stac_flutter/data/socket/dto/request/get_user_device_list_request.dart';
import 'package:stac_flutter/domain/auth/repository/auth_repository.dart';
import 'package:stac_flutter/domain/socket/repository/socket_repository.dart';

class AddDeviceUseCase {
  final AuthRepository _authRepository;
  final SocketRepository _socketRepository;

  AddDeviceUseCase(
      {required AuthRepository authRepository,
      required SocketRepository socketRepository})
      : _authRepository = authRepository,
        _socketRepository = socketRepository;

  void execute(AddDeviceRequest addDeviceRequest) {
    _authRepository.addDevice(addDeviceRequest);
    Future.delayed(const Duration(milliseconds: 500)).then((value) {
      _socketRepository.getUserDeviceList(
          GetUserDeviceListRequest(userId: "", accessToken: ""));
    });
  }
}
