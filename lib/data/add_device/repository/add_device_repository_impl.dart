import 'package:stac_flutter/data/add_device/dto/request/add_device_request.dart';
import 'package:stac_flutter/domain/add_device/repository/add_device_repository.dart';
import 'package:stac_flutter/data/add_device/data_source/remote_add_device_data_source.dart';

class AddDeviceRepositoryImpl implements AddDeviceRepository {
  final RemoteAddDeviceDataSource _remoteAddDeviceDataSource;

  AddDeviceRepositoryImpl(
      {required RemoteAddDeviceDataSource remoteAddDeviceDataSource})
      : _remoteAddDeviceDataSource = remoteAddDeviceDataSource;

  @override
  Future<bool> addDevice(AddDeviceRequest addDeviceRequest) async {
    return await _remoteAddDeviceDataSource.addDevice(addDeviceRequest);
  }
}
