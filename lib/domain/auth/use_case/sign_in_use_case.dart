import 'package:stac_flutter/data/dto/auth/request/sign_in_request.dart';
import 'package:stac_flutter/domain/auth/entity/jwt_token_entity.dart';
import 'package:stac_flutter/domain/auth/repository/auth_repository.dart';

class SignInUseCase {
  final AuthRepository _repository;

  SignInUseCase({required AuthRepository repository})
      : _repository = repository;

  Future<JWTTokenEntity> execute(SignInRequest signInRequest) async {
    final response = await _repository.signIn(signInRequest);
    return response;
  }
}
