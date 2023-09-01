import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:stac_flutter/data/dto/request/sign_in_request.dart';
import 'package:stac_flutter/data/dto/request/sign_up_request.dart';
import 'package:stac_flutter/data/dto/response/sign_in_response.dart';
import 'package:stac_flutter/domain/entity/jwt_token_entity.dart';
import 'package:stac_flutter/secret.dart';

class AuthDataSource {
  Future<JWTTokenEntity> signIn(SignInRequest signInRequest) async {
    final response = await http.post(
        Uri.parse("$baseUrl/login"), body: signInRequest.toJson());
    if (response.statusCode != 200) {
      throw Exception(response.body);
    }
    return SignInResponse.fromJson(jsonDecode(response.body)).toEntity();
  }

  Future<bool> signUp(SignUpRequest signUpRequest) async {
    final response = await http.post(Uri.parse("$baseUrl/sign"),
        body: signUpRequest.toJson());
    if (response.statusCode == 500) {
      return false;
    }
    return true;
  }
}
