class RefreshRequest {
  String refreshToken;

  RefreshRequest({required this.refreshToken});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['refreshToken'] = refreshToken;
    return data;
  }
}
