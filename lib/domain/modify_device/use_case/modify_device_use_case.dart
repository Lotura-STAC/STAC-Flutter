import 'dart:io';

import 'package:stac_flutter/data/modify_device/dto/request/modify_device_request.dart';
import 'package:stac_flutter/data/socket/dto/request/get_user_device_list_request.dart';
import 'package:stac_flutter/domain/modify_device/repository/modify_device_repository.dart';
import 'package:stac_flutter/domain/socket/repository/socket_repository.dart';

class ModifyDeviceUseCase {
  final ModifyDeviceRepository _modifyDeviceRepository;
  final SocketRepository _socketRepository;

  ModifyDeviceUseCase(
      {required ModifyDeviceRepository modifyDeviceRepository,
      required SocketRepository socketRepository})
      : _modifyDeviceRepository = modifyDeviceRepository,
        _socketRepository = socketRepository;

  Future<bool> execute(ModifyDeviceRequest modifyDeviceRequest) async {
    final response =
        await _modifyDeviceRepository.modifyDevice(modifyDeviceRequest);
    _socketRepository
        .getUserDeviceList(GetUserDeviceListRequest(accessToken: ""));
    return response;
  }
}
