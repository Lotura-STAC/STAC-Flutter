import 'package:stac_flutter/data/auth/dto/response/sign_in_response.dart';
import 'package:stac_flutter/domain/auth/entity/jwt_token_entity.dart';

class RefreshResponse {
  String accessToken;
  String refreshToken;
  Role role;

  RefreshResponse(
      {required this.accessToken,
      required this.refreshToken,
      required this.role});

  factory RefreshResponse.fromJson(Map<String, dynamic> json) =>
      RefreshResponse(
        accessToken: json['accessToken'],
        refreshToken: json['refreshToken'],
        role: json['role'] == Role.admin.name ? Role.admin : Role.guest,
      );

  JWTTokenEntity toEntity() => JWTTokenEntity(
      accessToken: accessToken, refreshToken: refreshToken, role: role);
}
