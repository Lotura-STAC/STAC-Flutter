import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalSocketDataSource {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<void> saveDeviceName(String name, deviceNum) async {
    await _storage.write(key: deviceNum, value: name);
  }

  Future<void> saveUserId(String userId) async {
    await _storage.write(key: 'usreId', value: userId);
  }

  Future<String> getToken() async {
    final accessToken = await _storage.read(key: 'accessToken');
    return accessToken!;
  }

  Future<String> getUserId() async {
    final userId = await _storage.read(key: 'userId');
    return userId!;
  }
}
