import 'package:stac_flutter/data/modify_device/data_source/remote_modify_device_data_source.dart';
import 'package:stac_flutter/data/modify_device/dto/request/modify_device_request.dart';
import 'package:stac_flutter/domain/modify_device/repository/modify_device_repository.dart';

class ModifyDeviceRepositoryImpl extends ModifyDeviceRepository {
  final RemoteModifyDeviceDataSource _remoteModifyDeviceDataSource;

  ModifyDeviceRepositoryImpl(
      {required RemoteModifyDeviceDataSource remoteModifyDeviceDataSource})
      : _remoteModifyDeviceDataSource = remoteModifyDeviceDataSource;

  @override
  Future<bool> modifyDevice(ModifyDeviceRequest modifyDeviceRequest) async {
    return await _remoteModifyDeviceDataSource
        .modifyDevice(modifyDeviceRequest);
  }
}
