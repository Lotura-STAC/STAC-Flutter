class SignUpRequest {
  String adminId;
  String adminPw;
  String? guestId;
  String? guestPw;

  SignUpRequest(
      {required this.adminId,
      required this.adminPw,
      this.guestId,
      this.guestPw});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['admin_id'] = adminId;
    data['admin_pw'] = adminPw;
    data['guest_id'] = guestId;
    data['guest_pw'] = guestPw;
    return data;
  }
}
