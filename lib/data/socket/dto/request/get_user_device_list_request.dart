class GetUserDeviceListRequest {
  String accessToken;

  GetUserDeviceListRequest({required this.accessToken});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['accesstoken'] = accessToken;
    return data;
  }
}
