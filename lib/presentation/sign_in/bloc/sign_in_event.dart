import 'package:equatable/equatable.dart';
import 'package:stac_flutter/data/dto/auth/request/sign_in_request.dart';

abstract class SignInEvent extends Equatable {}

class SignIn extends SignInEvent {
  final SignInRequest signInRequest;

  SignIn({required this.signInRequest});

  @override
  List<Object?> get props => [signInRequest];
}
