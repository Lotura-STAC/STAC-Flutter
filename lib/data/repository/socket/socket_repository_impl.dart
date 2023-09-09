import 'package:stac_flutter/data/data_source/socket/local_socket_data_source.dart';
import 'package:stac_flutter/data/data_source/socket/remote_socket_data_source.dart';
import 'package:stac_flutter/data/dto/auth/request/add_device_request.dart';
import 'package:stac_flutter/data/dto/auth/request/get_user_device_list_request.dart';
import 'package:stac_flutter/data/dto/auth/request/remove_device_request.dart';
import 'package:stac_flutter/data/dto/auth/request/socket_login_request.dart';
import 'package:stac_flutter/data/dto/auth/response/get_user_device_list_response.dart';
import 'package:stac_flutter/domain/auth/repository/socket_repository.dart';

class SocketRepositoryImpl implements SocketRepository {
  final RemoteSocketDataSource _remoteSocketDataSource;
  final LocalSocketDataSource _localSocketDataSource;

  SocketRepositoryImpl(
      {required RemoteSocketDataSource remoteSocketDataSource,
      required LocalSocketDataSource localSocketDataSource})
      : _remoteSocketDataSource = remoteSocketDataSource,
        _localSocketDataSource = localSocketDataSource;

  @override
  void addDevice(AddDeviceRequest addDeviceRequest, String deviceName) async {
    addDeviceRequest.userId = await _localSocketDataSource.getUserId();
    addDeviceRequest.accessToken = await _localSocketDataSource.getToken();
    await _localSocketDataSource.saveDeviceName(
        deviceName, addDeviceRequest.deviceNo);
    _remoteSocketDataSource.addDevice(addDeviceRequest);
  }

  @override
  void getUserDeviceList(GetUserDeviceListRequest getUserDeviceListRequest) {
    _remoteSocketDataSource.getUserDeviceList(getUserDeviceListRequest);
  }

  @override
  void removeDevice(RemoveDeviceRequest removeDeviceRequest) {
    _remoteSocketDataSource.removeDevice(removeDeviceRequest);
  }

  @override
  Stream<GetUserDeviceListResponse> get userDeviceListStream =>
      _remoteSocketDataSource.userDeviceListStream;

  @override
  Future<void> saveDeviceName(String name, deviceNum) async {
    await _localSocketDataSource.saveDeviceName(name, deviceNum);
  }

  @override
  void socketLogin(SocketLoginRequest socketLoginRequest) {
    _remoteSocketDataSource.socketLogin(socketLoginRequest);
  }
}
