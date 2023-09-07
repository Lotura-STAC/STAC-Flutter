import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:stac_flutter/data/dto/auth/request/refresh_request.dart';
import 'package:stac_flutter/data/dto/auth/request/sign_in_request.dart';
import 'package:stac_flutter/data/dto/auth/request/sign_up_request.dart';
import 'package:stac_flutter/data/dto/auth/response/refresh_response.dart';
import 'package:stac_flutter/data/dto/auth/response/sign_in_response.dart';
import 'package:stac_flutter/domain/auth/entity/jwt_token_entity.dart';
import 'package:stac_flutter/secret.dart';

class AuthDataSource {
  Future<JWTTokenEntity> signIn(SignInRequest signInRequest) async {
    final response = await http.post(Uri.parse("$baseUrl/login"),
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode(signInRequest.toJson()));
    if (response.statusCode != 200) {
      throw Exception(response.body);
    }
    return SignInResponse.fromJson(jsonDecode(response.body)).toEntity();
  }

  Future<bool> signUp(SignUpRequest signUpRequest) async {
    final response = await http.post(Uri.parse("$baseUrl/sign"),
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode(signUpRequest.toJson()));
    if (response.statusCode == 500) {
      return false;
    }
    return true;
  }

  Future<JWTTokenEntity> refresh(RefreshRequest refreshRequest) async {
    final response = await http.post(Uri.parse("$baseUrl/refresh"),
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode(refreshRequest.toJson()));
    if (response.statusCode != 200) {
      throw Exception(response.body);
    }
    return RefreshResponse.fromJson(jsonDecode(response.body)).toEntity();
  }
}
