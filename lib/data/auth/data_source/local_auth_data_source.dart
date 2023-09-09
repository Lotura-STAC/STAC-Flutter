import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:stac_flutter/domain/auth/entity/jwt_token_entity.dart';

class LocalAuthDateSource {
  final _storage = const FlutterSecureStorage();

  Future<void> signOut() async {
    await _storage.deleteAll();
  }

  Future<void> saveUserId(String userId) async {
    await _storage.write(key: 'userId', value: userId);
  }

  Future<void> saveToken(JWTTokenEntity jwtTokenEntity) async {
    await _storage.write(key: 'accessToken', value: jwtTokenEntity.accessToken);
    await _storage.write(
        key: 'refreshToken', value: jwtTokenEntity.refreshToken);
  }
}
