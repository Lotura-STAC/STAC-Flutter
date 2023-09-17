import 'dart:convert';

import 'package:stac_flutter/core/utils/jwt_store.dart';
import 'package:stac_flutter/data/notify/dto/request/notify_admin_request.dart';
import 'package:stac_flutter/data/notify/dto/request/notify_request.dart';
import 'package:stac_flutter/secret.dart';
import 'package:http/http.dart' as http;

class RemoteNotifyDataSource {
  Future<bool> notify(NotifyRequest notifyRequest) async {
    final token = await JWTStore.getAccessToken();
    final response = await http.post(Uri.parse("$baseUrl/notify_me"),
        headers: <String, String>{
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        },
        body: jsonEncode(notifyRequest.toJson()));
    if (response.statusCode == 400) {
      return false;
    }
    return true;
  }

  Future<bool> notifyAdmin(NotifyAdminRequest notifyAdminRequest) async {
    final token = await JWTStore.getAccessToken();
    final response = await http.post(Uri.parse("$baseUrl/notify_me_admin"),
        headers: <String, String>{
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        },
        body: jsonEncode(notifyAdminRequest.toJson()));
    if (response.statusCode == 400) return false;
    return true;
  }
}
