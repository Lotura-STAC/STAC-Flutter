class SocketLoginRequest {
  String accessToken;
  String userId;

  SocketLoginRequest({required this.accessToken, required this.userId});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['accesstoken'] = accessToken;
    data['user_id'] = userId;
    return data;
  }
}
