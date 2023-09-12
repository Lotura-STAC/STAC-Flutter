import 'dart:convert';

import 'package:stac_flutter/core/utils/jwt_store.dart';
import 'package:stac_flutter/data/remove_device/dto/remove_device_request.dart';
import 'package:http/http.dart' as http;
import 'package:stac_flutter/secret.dart';

class RemoteRemoveDeviceDataSource {
  Future<bool> removeDevice(RemoveDeviceRequest removeDeviceRequest) async {
    final token = await JWTStore.getAccessToken();
    final response = await http.post(Uri.parse("$baseUrl/remove_device"),
        headers: <String, String>{
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        },
        body: jsonEncode(removeDeviceRequest.toJson()));
    if (response.statusCode == 400) {
      return false;
    }
    return true;
  }
}
