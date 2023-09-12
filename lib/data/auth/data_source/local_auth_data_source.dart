import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalAuthDateSource {
  final _storage = const FlutterSecureStorage();

  Future<void> signOut() async {
    await _storage.deleteAll();
  }

}
