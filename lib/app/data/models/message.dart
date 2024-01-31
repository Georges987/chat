import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String text;
  final String senderId;
  final String receiverId;
  final String senderEmail;
  final Timestamp createdAt;

  Message(
    this.text,
    this.senderId,
    this.receiverId,
    this.createdAt,
    this.senderEmail,
  );

  // convert to map
  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'senderId': senderId,
      'receiverId': receiverId,
      'senderEmail': senderEmail,
      'createdAt': createdAt,
    };
  }

  Message.fromJson(Map<String, dynamic> json)
      : text = json['text'],
        senderId = json['senderId'],
        receiverId = json['receiverId'],
        senderEmail = json['senderEmail'],
        createdAt = json['createdAt'];

  Map<String, dynamic> toJson() => {
        'text': text,
        'senderId': senderId,
        'receiverId': receiverId,
        'senderEmail': senderEmail,
        'createdAt': createdAt,
      };
}
