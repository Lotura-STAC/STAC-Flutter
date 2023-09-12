import 'package:stac_flutter/data/remove_device/data_source/remote_remove_device_data_source.dart';
import 'package:stac_flutter/data/remove_device/dto/remove_device_request.dart';
import 'package:stac_flutter/domain/remove_device/repository/remove_device_repository.dart';

class RemoveDeviceRepositoryImpl implements RemoveDeviceRepository {
  final RemoteRemoveDeviceDataSource _remoteRemoveDeviceDataSource;

  RemoveDeviceRepositoryImpl(
      {required RemoteRemoveDeviceDataSource remoteRemoveDeviceDataSource})
      : _remoteRemoveDeviceDataSource = remoteRemoveDeviceDataSource;

  @override
  Future<bool> removeDevice(RemoveDeviceRequest removeDeviceRequest) async {
    return await _remoteRemoveDeviceDataSource
        .removeDevice(removeDeviceRequest);
  }
}
