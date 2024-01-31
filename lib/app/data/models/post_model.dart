class Post {
  String? uid;
  String? post;
  String? time;
  String? image;

  Post({this.uid, this.post, this.time, this.image});

  Post.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    post = json['post'];
    time = json['time'];
    image = json['image'];
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'post': post,
      'time': time,
      'image': image,
    };
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['uid'] = uid;
    data['post'] = post;
    data['time'] = time;
    data['image'] = image;
    return data;
  }
}
