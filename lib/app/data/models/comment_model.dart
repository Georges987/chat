class Comment {
  String? comment;
  String? uid;
  String? postId;
  String? time;

  Comment({this.comment, this.uid, this.postId, this.time});

  Comment.fromJson(Map<String, dynamic> json) {
    comment = json['comment'];
    uid = json['uid'];
    postId = json['postId'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['comment'] = comment;
    data['uid'] = uid;
    data['postId'] = postId;
    data['time'] = time;
    return data;
  }
}
