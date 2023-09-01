import 'package:stac_flutter/data/data_source/auth/auth_data_source.dart';
import 'package:stac_flutter/data/dto/auth/request/refresh_request.dart';
import 'package:stac_flutter/data/dto/auth/request/sign_in_request.dart';
import 'package:stac_flutter/data/dto/auth/request/sign_up_request.dart';
import 'package:stac_flutter/domain/auth/entity/jwt_token_entity.dart';
import 'package:stac_flutter/domain/auth/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource dataSource;

  AuthRepositoryImpl({required this.dataSource});

  @override
  Future<JWTTokenEntity> signIn(SignInRequest signInRequest) async =>
      await dataSource.signIn(signInRequest);

  @override
  Future<bool> signUp(SignUpRequest signUpRequest) async =>
      await dataSource.signUp(signUpRequest);

  @override
  Future<JWTTokenEntity> refresh(RefreshRequest refreshRequest) async =>
      await dataSource.refresh(refreshRequest);
}
