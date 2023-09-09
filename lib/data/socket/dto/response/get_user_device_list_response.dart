class GetUserDeviceListResponse {
  final List<_GetUserDeviceListResponse> list;

  GetUserDeviceListResponse({required this.list});

  factory GetUserDeviceListResponse.fromJson(List<dynamic> json) {
    List<_GetUserDeviceListResponse> list = <_GetUserDeviceListResponse>[];
    list = json.map((i) => _GetUserDeviceListResponse.fromJson(i)).toList();

    return GetUserDeviceListResponse(
      list: list,
    );
  }
}

class _GetUserDeviceListResponse {
  String userId;
  String deviceNo;
  String deviceType;
  int currStatus;

  _GetUserDeviceListResponse(
      {required this.userId,
      required this.deviceNo,
      required this.deviceType,
      required this.currStatus});

  factory _GetUserDeviceListResponse.fromJson(Map<String, dynamic> json) =>
      _GetUserDeviceListResponse(
        userId: json['user_id'],
        deviceNo: json['device_no'],
        deviceType: json['device_type'],
        currStatus: json['curr_status'],
      );
}
