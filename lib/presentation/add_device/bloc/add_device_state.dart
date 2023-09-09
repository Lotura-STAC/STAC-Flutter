import 'package:equatable/equatable.dart';

abstract class AddDeviceState extends Equatable {}

class Empty extends AddDeviceState {
  @override
  List<Object?> get props => [];
}

class Loading extends AddDeviceState {
  @override
  List<Object?> get props => [];
}

class Error extends AddDeviceState {
  final String message;

  Error({required this.message});

  @override
  List<Object?> get props => [message];
}

class Loaded extends AddDeviceState {
  @override
  List<Object?> get props => [];
}
