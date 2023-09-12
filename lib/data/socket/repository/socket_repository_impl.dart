import 'dart:async';

import 'package:stac_flutter/core/utils/jwt_store.dart';
import 'package:stac_flutter/data/socket/data_source/remote_socket_data_source.dart';
import 'package:stac_flutter/data/socket/dto/request/get_user_device_list_request.dart';
import 'package:stac_flutter/data/socket/dto/response/get_user_device_list_response.dart';
import 'package:stac_flutter/domain/socket/repository/socket_repository.dart';

class SocketRepositoryImpl implements SocketRepository {
  final RemoteSocketDataSource _remoteSocketDataSource;

  SocketRepositoryImpl({required RemoteSocketDataSource remoteSocketDataSource})
      : _remoteSocketDataSource = remoteSocketDataSource;

  @override
  Stream<GetUserDeviceListResponse> get userDeviceList =>
      _remoteSocketDataSource.userDeviceListStream;

  @override
  void getUserDeviceList(
      GetUserDeviceListRequest getUserDeviceListRequest) async {
    getUserDeviceListRequest.accessToken = await JWTStore.getAccessToken();
    _remoteSocketDataSource.getUserDeviceList(getUserDeviceListRequest);
  }
}
