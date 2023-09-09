import 'dart:async';

import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:stac_flutter/data/dto/auth/request/add_device_request.dart';
import 'package:stac_flutter/data/dto/auth/request/get_user_device_list_request.dart';
import 'package:stac_flutter/data/dto/auth/request/remove_device_request.dart';
import 'package:stac_flutter/data/dto/auth/request/socket_login_request.dart';
import 'package:stac_flutter/data/dto/auth/response/get_user_device_list_response.dart';
import 'package:stac_flutter/secret.dart';

class RemoteSocketDataSource {
  final IO.Socket _socket = IO.io(
      '$baseUrl/app',
      IO.OptionBuilder()
          .setTransports(['websocket'])
          .enableForceNewConnection()
          .build());

  late final StreamController<GetUserDeviceListResponse> _streamController;

  RemoteSocketDataSource(
      {required StreamController<GetUserDeviceListResponse> streamController}) {
    _streamController = streamController;
  }

  Stream<GetUserDeviceListResponse> get userDeviceListStream =>
      _streamController.stream.asBroadcastStream();

  void socketLogin(SocketLoginRequest socketLoginRequest) {
    _socket.emit('Socket_login', socketLoginRequest);
  }

  void addDevice(AddDeviceRequest addDeviceRequest) {
    _socket.emit('Add_Device', addDeviceRequest);
  }

  void removeDevice(RemoveDeviceRequest removeDeviceRequest) {
    _socket.emit('Remove_Device', removeDeviceRequest);
  }

  void getUserDeviceList(GetUserDeviceListRequest getUserDeviceListRequest) {
    _socket.emit('request_data_all', getUserDeviceListRequest);
    _socket.on(
        'update',
        (data) => _streamController.sink
            .add(GetUserDeviceListResponse.fromJson(data)));
  }
}
