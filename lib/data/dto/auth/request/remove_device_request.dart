class DeleteDeviceRequest {
  String userId;
  String accessToken;
  String deviceNo;

  DeleteDeviceRequest(
      {required this.userId,
      required this.accessToken,
      required this.deviceNo});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['accessToken'] = accessToken;
    data['deviceNo'] = deviceNo;
    return data;
  }
}
