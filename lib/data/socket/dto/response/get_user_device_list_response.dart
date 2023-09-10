import 'package:stac_flutter/domain/socket/entity/user_device_list_entity.dart';

class GetUserDeviceListResponse {
  final List<GetUserDeviceResponse> list;

  GetUserDeviceListResponse({required this.list});

  factory GetUserDeviceListResponse.fromJson(List<dynamic> json) {
    List<GetUserDeviceResponse> list = <GetUserDeviceResponse>[];
    list = json.map((i) => GetUserDeviceResponse.fromJson(i)).toList();

    return GetUserDeviceListResponse(
      list: list,
    );
  }

  // List<UserDeviceEntity> toEntity() {
  //   List<UserDeviceEntity> userDeviceListEntity = List.empty(growable: true);
  //   list.map((e) => userDeviceListEntity.add(UserDeviceEntity(
  //       deviceNo: e.deviceNo,
  //       deviceType: e.deviceType,
  //       currStatus: e.currStatus)));
  //
  //   return userDeviceListEntity;
  // }
}

class GetUserDeviceResponse {
  String userId;
  String deviceNo;
  String deviceType;
  int currStatus;

  GetUserDeviceResponse(
      {required this.userId,
      required this.deviceNo,
      required this.deviceType,
      required this.currStatus});

  factory GetUserDeviceResponse.fromJson(Map<String, dynamic> json) =>
      GetUserDeviceResponse(
        userId: json['user_id'],
        deviceNo: json['device_no'],
        deviceType: json['device_type'],
        currStatus: json['curr_status'],
      );
}
