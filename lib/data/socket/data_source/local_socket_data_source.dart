import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalSocketDataSource {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<String> getToken() async {
    final accessToken = await _storage.read(key: 'accessToken');
    return accessToken!;
  }
}
