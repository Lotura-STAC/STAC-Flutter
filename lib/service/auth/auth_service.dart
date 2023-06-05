import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:stac_flutter/secret.dart';

class AuthService {
  static Future<int> signUp(String id, pw) async {
    final response = await http
        .post(Uri.parse("$baseUrl/sign"), body: {"id": id, "password": pw});
    print(response.statusCode);
    if (response.statusCode == 200) {
      return 200;
    } else if (response.statusCode == 202) {
      return 202;
    } else if (response.statusCode == 500) {
      return 500;
    } else {
      throw Exception(response.body);
    }
  }
}
