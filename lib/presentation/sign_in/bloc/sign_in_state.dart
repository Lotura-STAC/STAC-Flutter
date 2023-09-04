import 'package:equatable/equatable.dart';
import 'package:stac_flutter/domain/auth/entity/jwt_token_entity.dart';

abstract class SignInState extends Equatable {}

class Empty extends SignInState {
  @override
  List<Object?> get props => [];
}

class Loading extends SignInState {
  @override
  List<Object?> get props => [];
}

class Error extends SignInState {
  final String message;

  Error({required this.message});

  @override
  List<Object?> get props => [message];
}

class Loaded extends SignInState {
  final JWTTokenEntity jwtTokenEntity;

  Loaded({required this.jwtTokenEntity});

  @override
  List<Object?> get props => [jwtTokenEntity];
}
