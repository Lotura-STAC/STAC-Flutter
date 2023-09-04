import 'package:equatable/equatable.dart';

abstract class SignUpState extends Equatable {}

class Empty extends SignUpState {
  @override
  List<Object?> get props => [];
}

class Loading extends SignUpState {
  @override
  List<Object?> get props => [];
}

class Error extends SignUpState {
  final String message;

  Error({required this.message});

  @override
  List<Object?> get props => [message];
}

class Loaded extends SignUpState {
  final bool isSuccess;

  Loaded({required this.isSuccess});

  @override
  List<Object?> get props => [isSuccess];
}
