import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class JWTStore {
  static const _storage = FlutterSecureStorage();

  static Future<String> getAccessToken() async {
    final accessToken = await _storage.read(key: 'accessToken') ?? "";
    return accessToken;
  }

  static Future<String> getRefreshToken() async {
    final refreshToken = await _storage.read(key: 'refreshToken') ?? "";
    return refreshToken;
  }

  static Future<void> setToken(String accessToken, refreshToken) async {
    await _storage.write(key: 'accessToken', value: accessToken);
    await _storage.write(key: 'refreshToken', value: refreshToken);
  }

  static Future<void> deleteAll() async {
    await _storage.deleteAll();
  }
}
