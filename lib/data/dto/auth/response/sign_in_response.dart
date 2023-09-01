import 'package:stac_flutter/domain/auth/entity/jwt_token_entity.dart';

class SignInResponse {
  String accessToken;
  String refreshToken;

  SignInResponse({required this.accessToken, required this.refreshToken});

  factory SignInResponse.fromJson(Map<String, dynamic> json) => SignInResponse(
        accessToken: json['accessToken'],
        refreshToken: json['refreshToken'],
      );

  JWTTokenEntity toEntity() =>
      JWTTokenEntity(accessToken: accessToken, refreshToken: refreshToken);
}
