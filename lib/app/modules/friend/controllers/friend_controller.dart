import 'package:chat/app/controllers/auth_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class FriendController extends GetxController {
  final AuthController authController = Get.find();

  final users = FirebaseFirestore.instance.collection('users').snapshots();
  
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

  // List of friends
}
