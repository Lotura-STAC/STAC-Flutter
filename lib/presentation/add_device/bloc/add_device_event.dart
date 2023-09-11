import 'package:equatable/equatable.dart';
import 'package:stac_flutter/data/add_device/dto/request/add_device_request.dart';

abstract class AddDeviceEvent extends Equatable {}

class AddDevice extends AddDeviceEvent {
  final AddDeviceRequest addDeviceRequest;

  AddDevice({required this.addDeviceRequest});

  @override
  List<Object?> get props => [addDeviceRequest];
}
