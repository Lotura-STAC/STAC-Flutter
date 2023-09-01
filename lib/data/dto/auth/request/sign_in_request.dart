class SignInRequest {
  String id;
  String pw;

  SignInRequest({required this.id, required this.pw});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['pw'] = pw;
    return data;
  }
}
