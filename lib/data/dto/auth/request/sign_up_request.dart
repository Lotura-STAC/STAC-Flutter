class SignUpRequest {
  String id;
  String pw;

  SignUpRequest({required this.id, required this.pw});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['pw'] = pw;
    return data;
  }
}
