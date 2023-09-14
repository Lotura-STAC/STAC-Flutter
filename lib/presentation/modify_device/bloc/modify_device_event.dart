import 'package:equatable/equatable.dart';
import 'package:stac_flutter/data/modify_device/dto/request/modify_device_request.dart';

abstract class ModifyDeviceEvent extends Equatable {}

class ModifyDevice extends ModifyDeviceEvent {
  final ModifyDeviceRequest modifyDeviceRequest;

  ModifyDevice({required this.modifyDeviceRequest});

  @override
  List<Object?> get props => [];
}
