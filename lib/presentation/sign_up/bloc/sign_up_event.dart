import 'package:equatable/equatable.dart';
import 'package:stac_flutter/data/dto/auth/request/sign_up_request.dart';

abstract class SignUpEvent extends Equatable {}

class SignUp extends SignUpEvent {
  final SignUpRequest signUpRequest;

  SignUp({required this.signUpRequest});

  @override
  List<Object?> get props => [signUpRequest];
}
