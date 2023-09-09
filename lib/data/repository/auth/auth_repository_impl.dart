import 'package:stac_flutter/data/data_source/auth/remote_auth_data_source.dart';
import 'package:stac_flutter/data/dto/auth/request/refresh_request.dart';
import 'package:stac_flutter/data/dto/auth/request/sign_in_request.dart';
import 'package:stac_flutter/data/dto/auth/request/sign_up_request.dart';
import 'package:stac_flutter/domain/auth/entity/jwt_token_entity.dart';
import 'package:stac_flutter/domain/auth/repository/auth_repository.dart';
import 'package:stac_flutter/data/data_source/auth/local_auth_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final RemoteAuthDataSource _remoteAuthDataSource;
  final LocalAuthDateSource _localAuthDateSource;

  AuthRepositoryImpl(
      {required RemoteAuthDataSource remoteAuthDataSource,
      required LocalAuthDateSource localAuthDateSource})
      : _remoteAuthDataSource = remoteAuthDataSource,
        _localAuthDateSource = localAuthDateSource;

  @override
  Future<JWTTokenEntity> signIn(SignInRequest signInRequest) async {
    final response = await _remoteAuthDataSource.signIn(signInRequest);
    await _localAuthDateSource.saveUserId(signInRequest.id);
    await _localAuthDateSource.saveToken(response);
    return response;
  }

  @override
  Future<bool> signUp(SignUpRequest signUpRequest) async =>
      await _remoteAuthDataSource.signUp(signUpRequest);

  @override
  Future<JWTTokenEntity> refresh(RefreshRequest refreshRequest) async =>
      await _remoteAuthDataSource.refresh(refreshRequest);

  @override
  Future<void> signOut() async {
    await _localAuthDateSource.signOut();
  }
}
