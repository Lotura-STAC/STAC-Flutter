import 'package:stac_flutter/data/auth/dto/response/sign_in_response.dart';

class JWTTokenEntity {
  String accessToken;
  String refreshToken;
  Role role;

  JWTTokenEntity(
      {required this.accessToken,
      required this.refreshToken,
      required this.role});
}
