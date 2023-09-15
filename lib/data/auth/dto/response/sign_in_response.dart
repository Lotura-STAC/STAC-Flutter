import 'package:stac_flutter/domain/auth/entity/jwt_token_entity.dart';

enum Role { admin, guest }

class SignInResponse {
  String accessToken;
  String refreshToken;
  Role role;

  SignInResponse(
      {required this.accessToken,
      required this.refreshToken,
      required this.role});

  factory SignInResponse.fromJson(Map<String, dynamic> json) => SignInResponse(
        accessToken: json['accessToken'],
        refreshToken: json['refreshToken'],
        role: json['role'] == Role.admin.name ? Role.admin : Role.guest,
      );

  JWTTokenEntity toEntity() => JWTTokenEntity(
      accessToken: accessToken, refreshToken: refreshToken, role: role);
}
