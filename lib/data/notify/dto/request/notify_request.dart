class NotifyRequest {
  String deviceToken;
  String deviceNo;

  NotifyRequest({required this.deviceToken, required this.deviceNo});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['deviceToken'] = deviceToken;
    data['device_no'] = deviceNo;
    return data;
  }
}
