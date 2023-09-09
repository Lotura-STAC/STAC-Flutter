import 'package:equatable/equatable.dart';
import 'package:stac_flutter/data/socket/dto/request/add_device_request.dart';

abstract class AddDeviceEvent extends Equatable {}

class AddDevice extends AddDeviceEvent {
  final AddDeviceRequest addDeviceRequest;
  final String deviceName;

  AddDevice({required this.addDeviceRequest, required this.deviceName});

  @override
  List<Object?> get props => [addDeviceRequest, deviceName];
}
