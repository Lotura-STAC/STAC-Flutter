class AddDeviceRequest {
  String userId;
  String accessToken;
  String deviceNo;
  String name;
  String deviceType;

  AddDeviceRequest(
      {required this.userId,
      required this.accessToken,
      required this.deviceNo,
      required this.name,
      required this.deviceType});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['accesstoken'] = accessToken;
    data['device_no'] = deviceNo;
    data['device_type'] = deviceType;
    data['name'] = name;
    return data;
  }
}
