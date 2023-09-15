import 'package:equatable/equatable.dart';
import 'package:stac_flutter/data/auth/dto/request/sign_in_request.dart';

abstract class SignInEvent extends Equatable {}

class SignIn extends SignInEvent {
  final SignInRequest signInRequest;

  SignIn({required this.signInRequest});

  @override
  List<Object?> get props => [signInRequest];
}

class ResetEvent extends SignInEvent {
  @override
  List<Object?> get props => [];
}
