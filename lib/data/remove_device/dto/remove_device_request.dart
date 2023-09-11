class RemoveDeviceRequest {
  String deviceNo;

  RemoveDeviceRequest({required this.deviceNo});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['device_no'] = deviceNo;
    return data;
  }
}
