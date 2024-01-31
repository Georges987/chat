import 'package:chat/app/controllers/auth_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageController extends GetxController {
  //TODO: Implement MessageController

  final users = FirebaseFirestore.instance.collection('users').snapshots();

  final user = Get.find<AuthController>().user;

  @override
  void onInit() {
    super.onInit();
    debugPrint('init controller');
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
