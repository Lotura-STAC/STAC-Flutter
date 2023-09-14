import 'dart:convert';

import 'package:stac_flutter/core/utils/jwt_store.dart';
import 'package:stac_flutter/data/modify_device/dto/request/modify_device_request.dart';
import 'package:stac_flutter/secret.dart';
import 'package:http/http.dart' as http;

class RemoteModifyDeviceDataSource {
  Future<bool> modifyDevice(ModifyDeviceRequest modifyDeviceRequest) async {
    final token = await JWTStore.getAccessToken();
    final response = await http.post(Uri.parse("$baseUrl/rename_device"),
        headers: <String, String>{
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        },
        body: jsonEncode(modifyDeviceRequest.toJson()));
    if (response.statusCode == 400) {
      return false;
    }
    return true;
  }
}
