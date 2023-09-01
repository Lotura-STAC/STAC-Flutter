import 'package:stac_flutter/data/dto/request/sign_in_request.dart';
import 'package:stac_flutter/data/dto/request/sign_up_request.dart';
import 'package:stac_flutter/domain/entity/jwt_token_entity.dart';

abstract class AuthRepository {
  Future<JWTTokenEntity> signIn(SignInRequest signInRequest);

  Future<bool> signUp(SignUpRequest signUpRequest);
}
