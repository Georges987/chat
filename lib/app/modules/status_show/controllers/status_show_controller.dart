import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StatusShowController extends GetxController {
  // TODO: Implement StatusShowController

  final image = "".obs;
  final post = "".obs;
  final postId = "".obs;

  final TextEditingController _controller = TextEditingController();

  TextEditingController get controller => _controller;

  @override
  void onInit() {
    super.onInit();
    image.value = Get.parameters["image"] ?? "";
    post.value = Get.parameters["post"] ?? "";
    postId.value = Get.parameters["postId"] ?? "";
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
