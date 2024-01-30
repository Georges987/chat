import 'package:chat/app/controllers/auth_controller.dart';
import 'package:chat/app/modules/home/views/friends_view.dart';
import 'package:chat/app/modules/home/views/homepage_view.dart';
import 'package:chat/app/modules/home/views/notification_view.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final authcontroller = Get.find<AuthController>();

  final currentIndex = 0.obs;

  final pages = [
    const HomepageView(),
    const FriendsView(),
    const NotificationView(),
  ].obs;

  void changeIndex(val) {
    currentIndex.value = val;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    Get.showSnackbar(const GetSnackBar(
      message: "Signed Out",
      duration: Duration(seconds: 3),
    ));
  }

  // Login for home page controller

  @override
  void onClose() {
    super.onClose();
  }
}
