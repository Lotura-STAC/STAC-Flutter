import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalSocketDataSource {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<void> saveDeviceName(String name, deviceNum) async {
    await _storage.write(key: deviceNum, value: name);
  }
}
