import 'package:stac_flutter/data/auth/dto/request/refresh_request.dart';
import 'package:stac_flutter/data/auth/dto/request/sign_in_request.dart';
import 'package:stac_flutter/data/auth/dto/request/sign_up_request.dart';
import 'package:stac_flutter/domain/auth/entity/jwt_token_entity.dart';

abstract class AuthRepository {
  Future<JWTTokenEntity> signIn(SignInRequest signInRequest);

  Future<bool> signUp(SignUpRequest signUpRequest);

  Future<JWTTokenEntity> refresh(RefreshRequest refreshRequest);

  Future<void> signOut();
}
