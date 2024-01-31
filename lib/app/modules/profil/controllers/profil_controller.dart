import 'package:chat/app/controllers/auth_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ProfilController extends GetxController {
  //TODO: Implement ProfilController
  final authController = Get.find<AuthController>();
  final authuser = FirebaseFirestore.instance
      .collection('users')
      .where('uid', isEqualTo: Get.find<AuthController>().user!.uid)
      .snapshots();

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
}
