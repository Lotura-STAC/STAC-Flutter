class GetUserDeviceListRequest {
  String userId;
  String accessToken;

  GetUserDeviceListRequest({required this.userId, required this.accessToken});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['accesstoken'] = accessToken;
    return data;
  }
}
