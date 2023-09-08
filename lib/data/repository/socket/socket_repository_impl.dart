import 'package:stac_flutter/data/data_source/socket/remote_socket_data_source.dart';
import 'package:stac_flutter/data/dto/auth/request/add_device_request.dart';
import 'package:stac_flutter/data/dto/auth/request/get_user_device_list_request.dart';
import 'package:stac_flutter/data/dto/auth/request/remove_device_request.dart';
import 'package:stac_flutter/data/dto/auth/response/get_user_device_list_response.dart';
import 'package:stac_flutter/domain/auth/repository/socket_repository.dart';

class SocketRepositoryImpl implements SocketRepository {
  final RemoteSocketDataSource _dataSource;

  SocketRepositoryImpl({required RemoteSocketDataSource dataSource})
      : _dataSource = dataSource;

  @override
  void addDevice(AddDeviceRequest addDeviceRequest) {
    _dataSource.addDevice(addDeviceRequest);
  }

  @override
  void getUserDeviceList(GetUserDeviceListRequest getUserDeviceListRequest) {
    _dataSource.getUserDeviceList(getUserDeviceListRequest);
  }

  @override
  void removeDevice(RemoveDeviceRequest removeDeviceRequest) {
    _dataSource.removeDevice(removeDeviceRequest);
  }

  @override
  Stream<GetUserDeviceListResponse> get userDeviceListStream =>
      _dataSource.userDeviceListStream;
}
