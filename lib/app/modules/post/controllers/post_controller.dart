import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class PostController extends GetxController {
  final permission = false.obs;

  TextEditingController _controller = TextEditingController();

  TextEditingController get controller => _controller;

  Future<void> checkStoragePermission() async {
    if (await Permission.storage.isGranted) {
      permission.value = true;
    } else if (await Permission.storage.isPermanentlyDenied) {
      openAppSettings();
      permission.value = false;
    } else {
      permission.value = false;
    }
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    debugPrint("Post Controller is ready");
    await checkStoragePermission();
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
