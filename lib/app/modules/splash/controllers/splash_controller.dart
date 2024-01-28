import 'package:chat/app/controllers/auth_controller.dart';
import 'package:chat/env.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController

  final authController = Get.put(AuthController(), permanent: true);

  final version = "".obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    version.value = APP_VERSION;
    debugPrint("Initialize Splash Screen");
    Future.delayed(const Duration(seconds: 3), () {
      checkAuthentication();
    });
  }

  void checkAuthentication() {
    authController.authStateChanges.listen((user) {
      if (user != null) {
        Get.offNamed('/home');
      } else {
        Get.offNamed('/login');
      }
    });
  }

  @override
  void onClose() {
    super.onClose();
  }
}
