class AddDeviceRequest {
  String name;
  String deviceNo;
  String deviceType;

  AddDeviceRequest({
    required this.name,
    required this.deviceNo,
    required this.deviceType,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['device_no'] = deviceNo;
    data['device_type'] = deviceType;
    return data;
  }
}
