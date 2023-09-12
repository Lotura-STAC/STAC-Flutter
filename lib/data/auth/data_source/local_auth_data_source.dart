import 'package:stac_flutter/core/utils/jwt_store.dart';

class LocalAuthDateSource {
  Future<void> signOut() async {
    await JWTStore.deleteAll();
  }
}
