import 'package:stac_flutter/data/data_source/auth/remote_auth_data_source.dart';
import 'package:stac_flutter/data/dto/auth/request/refresh_request.dart';
import 'package:stac_flutter/data/dto/auth/request/sign_in_request.dart';
import 'package:stac_flutter/data/dto/auth/request/sign_up_request.dart';
import 'package:stac_flutter/domain/auth/entity/jwt_token_entity.dart';
import 'package:stac_flutter/domain/auth/repository/auth_repository.dart';
import 'package:stac_flutter/data/data_source/auth/local_auth_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final RemoteAuthDataSource remoteAuthDataSource;
  final LocalAuthDateSource localAuthDateSource;

  AuthRepositoryImpl(
      {required this.remoteAuthDataSource, required this.localAuthDateSource});

  @override
  Future<JWTTokenEntity> signIn(SignInRequest signInRequest) async =>
      await remoteAuthDataSource.signIn(signInRequest);

  @override
  Future<bool> signUp(SignUpRequest signUpRequest) async =>
      await remoteAuthDataSource.signUp(signUpRequest);

  @override
  Future<JWTTokenEntity> refresh(RefreshRequest refreshRequest) async =>
      await remoteAuthDataSource.refresh(refreshRequest);

  @override
  Future<void> signOut() async {
    await localAuthDateSource.signOut();
  }
}
