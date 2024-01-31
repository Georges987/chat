import 'package:chat/app/controllers/auth_controller.dart';
import 'package:get/get.dart';

class SettingController extends GetxController {
  //TODO: Implement SettingController

  final authcontroller = Get.find<AuthController>();

  final user = Get.find<AuthController>().user;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void logout() {
    authcontroller.signOut();
    Get.snackbar(
      "Log Out",
      "Nous espérons que vous reviendrez bientôt",
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  @override
  void onClose() {
    super.onClose();
  }
}
