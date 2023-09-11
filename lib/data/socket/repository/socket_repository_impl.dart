import 'dart:async';

import 'package:stac_flutter/data/socket/data_source/local_socket_data_source.dart';
import 'package:stac_flutter/data/socket/data_source/remote_socket_data_source.dart';
import 'package:stac_flutter/data/socket/dto/request/add_device_request.dart';
import 'package:stac_flutter/data/socket/dto/request/get_user_device_list_request.dart';
import 'package:stac_flutter/data/socket/dto/request/remove_device_request.dart';
import 'package:stac_flutter/data/socket/dto/request/socket_login_request.dart';
import 'package:stac_flutter/data/socket/dto/response/get_user_device_list_response.dart';
import 'package:stac_flutter/domain/socket/repository/socket_repository.dart';

class SocketRepositoryImpl implements SocketRepository {
  final RemoteSocketDataSource _remoteSocketDataSource;
  final LocalSocketDataSource _localSocketDataSource;

  SocketRepositoryImpl(
      {required RemoteSocketDataSource remoteSocketDataSource,
      required LocalSocketDataSource localSocketDataSource})
      : _remoteSocketDataSource = remoteSocketDataSource,
        _localSocketDataSource = localSocketDataSource;

  @override
  Stream<GetUserDeviceListResponse> get userDeviceList =>
      _remoteSocketDataSource.userDeviceListStream;

  @override
  void addDevice(AddDeviceRequest addDeviceRequest) async {
    addDeviceRequest.userId = await _localSocketDataSource.getUserId();
    addDeviceRequest.accessToken = await _localSocketDataSource.getToken();
    _remoteSocketDataSource.addDevice(addDeviceRequest);
  }

  @override
  void getUserDeviceList(
      GetUserDeviceListRequest getUserDeviceListRequest) async {
    getUserDeviceListRequest.userId = await _localSocketDataSource.getUserId();
    getUserDeviceListRequest.accessToken =
        await _localSocketDataSource.getToken();
    _remoteSocketDataSource.getUserDeviceList(getUserDeviceListRequest);
  }

  @override
  void removeDevice(RemoveDeviceRequest removeDeviceRequest) {
    _remoteSocketDataSource.removeDevice(removeDeviceRequest);
  }
}
