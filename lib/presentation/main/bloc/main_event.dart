import 'package:equatable/equatable.dart';
import 'package:stac_flutter/data/remove_device/dto/remove_device_request.dart';
import 'package:stac_flutter/data/socket/dto/request/get_user_device_list_request.dart';

abstract class MainEvent extends Equatable {}

class GetUserDeviceListEvent extends MainEvent {
  final GetUserDeviceListRequest getUserDeviceListRequest;

  GetUserDeviceListEvent({required this.getUserDeviceListRequest});

  @override
  List<Object?> get props => [getUserDeviceListRequest];
}

class ModifyDeviceNameEvent extends MainEvent {
  @override
  List<Object?> get props => [];
}

class RemoveDeviceEvent extends MainEvent {
  final RemoveDeviceRequest removeDeviceRequest;

  RemoveDeviceEvent({required this.removeDeviceRequest});

  @override
  List<Object?> get props => [];
}
