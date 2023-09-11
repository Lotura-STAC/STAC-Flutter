import 'package:equatable/equatable.dart';
import 'package:stac_flutter/data/socket/dto/response/get_user_device_list_response.dart';
import 'package:stac_flutter/domain/socket/entity/user_device_list_entity.dart';

abstract class MainState extends Equatable {}

class Empty extends MainState {
  @override
  List<Object?> get props => [];
}

class Loading extends MainState {
  @override
  List<Object?> get props => [];
}

class Error extends MainState {
  final String message;

  Error({required this.message});

  @override
  List<Object?> get props => [];
}

class Loaded extends MainState {
  final GetUserDeviceListResponse list;

  Loaded({required this.list});

  @override
  List<Object?> get props => [list];
}
