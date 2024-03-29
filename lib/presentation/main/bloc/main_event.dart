import 'package:equatable/equatable.dart';
import 'package:stac_flutter/data/notify/dto/request/notify_request.dart';
import 'package:stac_flutter/data/remove_device/dto/remove_device_request.dart';
import 'package:stac_flutter/data/socket/dto/request/get_user_device_list_request.dart';

abstract class MainEvent extends Equatable {}

class GetUserDeviceListEvent extends MainEvent {
  final GetUserDeviceListRequest getUserDeviceListRequest;

  GetUserDeviceListEvent({required this.getUserDeviceListRequest});

  @override
  List<Object?> get props => [getUserDeviceListRequest];
}

class RemoveDeviceEvent extends MainEvent {
  final RemoveDeviceRequest removeDeviceRequest;

  RemoveDeviceEvent({required this.removeDeviceRequest});

  @override
  List<Object?> get props => [];
}

class NotifyEvent extends MainEvent {
  final NotifyRequest notifyRequest;

  NotifyEvent({required this.notifyRequest});

  @override
  List<Object?> get props => [];
}
