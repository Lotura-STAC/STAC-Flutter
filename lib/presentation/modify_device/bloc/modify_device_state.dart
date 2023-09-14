import 'package:equatable/equatable.dart';

abstract class ModifyDeviceState extends Equatable {}

class Empty extends ModifyDeviceState {
  @override
  List<Object?> get props => [];
}

class Loading extends ModifyDeviceState {
  @override
  List<Object?> get props => [];
}

class Error extends ModifyDeviceState {
  final String message;

  Error({required this.message});

  @override
  List<Object?> get props => [message];
}

class Loaded extends ModifyDeviceState {
  @override
  List<Object?> get props => [];
}
