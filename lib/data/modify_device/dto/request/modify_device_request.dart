class ModifyDeviceRequest {
  String deviceNo;
  String newName;

  ModifyDeviceRequest({
    required this.deviceNo,
    required this.newName,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['device_no'] = deviceNo;
    data['new_name'] = newName;
    return data;
  }
}
