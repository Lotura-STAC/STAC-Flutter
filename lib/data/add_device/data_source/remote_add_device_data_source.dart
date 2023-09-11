import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:stac_flutter/data/add_device/dto/request/add_device_request.dart';
import 'package:stac_flutter/secret.dart';

class RemoteAddDeviceDataSource {
  Future<bool> addDevice(AddDeviceRequest addDeviceRequest) async {
    final response = await http.post(Uri.parse("$baseUrl/add_device"),
        headers: <String, String>{"Content-Type": "application/json"},
        body: jsonEncode(addDeviceRequest.toJson()));
    if (response.statusCode == 400) {
      return false;
    }
    return true;
  }
}
