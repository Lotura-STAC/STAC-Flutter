import 'package:stac_flutter/core/utils/jwt_store.dart';
import 'package:stac_flutter/data/auth/data_source/remote_auth_data_source.dart';
import 'package:stac_flutter/data/auth/dto/request/refresh_request.dart';
import 'package:stac_flutter/data/auth/dto/request/sign_in_request.dart';
import 'package:stac_flutter/data/auth/dto/request/sign_up_request.dart';
import 'package:stac_flutter/domain/auth/entity/jwt_token_entity.dart';
import 'package:stac_flutter/domain/auth/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final RemoteAuthDataSource _remoteAuthDataSource;

  AuthRepositoryImpl({required RemoteAuthDataSource remoteAuthDataSource})
      : _remoteAuthDataSource = remoteAuthDataSource;

  @override
  Future<JWTTokenEntity> signIn(SignInRequest signInRequest) async {
    final response = await _remoteAuthDataSource.signIn(signInRequest);
    await JWTStore.setToken(response.accessToken, response.refreshToken);
    return response;
  }

  @override
  Future<bool> signUp(SignUpRequest signUpRequest) async =>
      await _remoteAuthDataSource.signUp(signUpRequest);

  @override
  Future<JWTTokenEntity> refresh(RefreshRequest refreshRequest) async =>
      await _remoteAuthDataSource.refresh(refreshRequest);

  @override
  Future<bool> signOut() async {
    return await _remoteAuthDataSource.signOut();
  }
}
