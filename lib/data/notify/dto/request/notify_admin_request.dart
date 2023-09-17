class NotifyAdminRequest {
  String deviceToken;

  NotifyAdminRequest({required this.deviceToken});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['deviceToken'] = deviceToken;
    return data;
  }
}
