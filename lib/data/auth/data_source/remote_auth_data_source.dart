import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stac_flutter/core/utils/jwt_store.dart';
import 'package:stac_flutter/data/auth/dto/request/refresh_request.dart';
import 'package:stac_flutter/data/auth/dto/request/sign_in_request.dart';
import 'package:stac_flutter/data/auth/dto/request/sign_up_request.dart';
import 'package:stac_flutter/data/auth/dto/response/refresh_response.dart';
import 'package:stac_flutter/data/auth/dto/response/sign_in_response.dart';
import 'package:stac_flutter/domain/auth/entity/jwt_token_entity.dart';
import 'package:stac_flutter/secret.dart';

class RemoteAuthDataSource {
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
      throw Exception("회원가입에 실패하였습니다");
    }
    if (response.statusCode == 400) {
      throw Exception("중복된 아이디입니다");
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

  Future<bool> signOut() async {
    final token = await JWTStore.getAccessToken();
    final response = await http.post(Uri.parse("$baseUrl/no_notify_admin"),
        headers: <String, String>{"Authorization": "Bearer $token"});
    if (response.statusCode == 400) {
      throw Exception("로그아웃 실패");
    }
    return true;
  }
}
