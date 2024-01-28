class AuthUser {
  String? uid;
  String? displayName;
  String? email;
  String? photoURL;
  bool? emailVerified;
  String? phoneNumber;

  AuthUser(
      {this.uid,
      this.displayName,
      this.email,
      this.photoURL,
      this.emailVerified,
      this.phoneNumber});

  AuthUser.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    displayName = json['displayName'];
    email = json['email'];
    photoURL = json['photoURL'];
    emailVerified = json['emailVerified'];
    phoneNumber = json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['uid'] = uid;
    data['displayName'] = displayName;
    data['email'] = email;
    data['photoURL'] = photoURL;
    data['emailVerified'] = emailVerified;
    data['phoneNumber'] = phoneNumber;
    return data;
  }
}
