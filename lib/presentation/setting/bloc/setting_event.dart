import 'package:equatable/equatable.dart';

abstract class SettingEvent extends Equatable {}

class SignOutEvent extends SettingEvent {
  @override
  List<Object?> get props => [];
}
