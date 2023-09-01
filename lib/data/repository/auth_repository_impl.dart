import 'package:stac_flutter/data/data_source/auth_data_source.dart';
import 'package:stac_flutter/data/dto/request/sign_in_request.dart';
import 'package:stac_flutter/data/dto/request/sign_up_request.dart';
import 'package:stac_flutter/domain/entity/jwt_token_entity.dart';
import 'package:stac_flutter/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource dataSource;

  AuthRepositoryImpl({required this.dataSource});

  @override
  Future<JWTTokenEntity> signIn(SignInRequest signInRequest) async =>
      await dataSource.signIn(signInRequest);

  @override
  Future<bool> signUp(SignUpRequest signUpRequest) async =>
      await dataSource.signUp(signUpRequest);
}
