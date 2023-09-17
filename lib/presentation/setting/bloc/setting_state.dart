import 'package:equatable/equatable.dart';

abstract class SettingState extends Equatable {}

class Empty extends SettingState {
  @override
  List<Object?> get props => [];
}

class Loading extends SettingState {
  @override
  List<Object?> get props => [];
}

class Error extends SettingState {
  final String message;

  Error({required this.message});

  @override
  List<Object?> get props => [];
}

class Loaded extends SettingState {
  @override
  List<Object?> get props => [];
}
