import 'package:equatable/equatable.dart';
import 'package:stac_flutter/data/auth/dto/request/sign_up_request.dart';

abstract class SignUpEvent extends Equatable {}

class SignUp extends SignUpEvent {
  final SignUpRequest signUpRequest;
  final String pwdCheck;

  SignUp({required this.signUpRequest, required this.pwdCheck});

  @override
  List<Object?> get props => [signUpRequest, pwdCheck];
}
