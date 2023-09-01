import 'package:stac_flutter/domain/auth/entity/jwt_token_entity.dart';

class RefreshResponse {
  String accessToken;
  String refreshToken;

  RefreshResponse({required this.accessToken, required this.refreshToken});

  factory RefreshResponse.fromJson(Map<String, dynamic> json) =>
      RefreshResponse(
        accessToken: json['accessToken'],
        refreshToken: json['refreshToken'],
      );

  JWTTokenEntity toEntity() =>
      JWTTokenEntity(accessToken: accessToken, refreshToken: refreshToken);
}
