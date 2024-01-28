class AuthUser {
  String? uid;
  String? username;
  String? email;

  AuthUser({this.uid, this.username, this.email});

  AuthUser.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    username = json['username'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['uid'] = uid;
    data['username'] = username;
    data['email'] = email;
    return data;
  }
}
