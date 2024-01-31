import 'package:chat/app/controllers/auth_controller.dart';
import 'package:chat/app/data/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DicussionController extends GetxController {
  //TODO: Implement DicussionController

  final receriverId = Get.parameters['receiverId'];
  final receiverEmail = Get.parameters['receiverEmail'];
  final receiverName = Get.parameters['receiverName'];

  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final AuthController authController = Get.find<AuthController>();

  final _messageController = TextEditingController();

  TextEditingController get messageController => _messageController;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  void send() async {
    if (_messageController.text.isNotEmpty) {
      sendMessage(receriverId!, _messageController.text);
      _messageController.clear();
    }
  }

  // Send message service
  void sendMessage(String receiverId, String text) async {
    //get the current info user
    final String currentUserId = auth.currentUser!.uid;
    final String currentUserEmail = auth.currentUser!.email.toString();
    final Timestamp currentTime = Timestamp.now();

    // create the message
    Message msg =
        Message(text, currentUserId, receiverId, currentTime, currentUserEmail);

    // construct chat room id from current user id and receiver id (concatenate and sort)
    List<String> ids = [currentUserId, receiverId];
    ids.sort();
    String chatRoomId = ids.join('_');

    // add new message to database
    await _firestore
        .collection('chatrooms')
        .doc(chatRoomId)
        .collection('messages')
        .add(msg.toMap());
  }

  Stream<QuerySnapshot> getMessages(String userId, String otherUserId) {
    List<String> ids = [userId, otherUserId];
    ids.sort();
    String chatRoomId = ids.join('_');

    debugPrint(chatRoomId);
    return _firestore
        .collection('chatrooms')
        .doc(chatRoomId)
        .collection('messages')
        .orderBy('createdAt', descending: false)
        .snapshots();
  }
}
