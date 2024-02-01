import 'package:chat/app/modules/home/views/homepage_view.dart';
import 'package:chat/app/modules/message/views/message_view.dart';
import 'package:chat/app/modules/notification/views/notification_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final userEmail = FirebaseAuth.instance.currentUser!.email.toString().obs;

  // get all posts

  final currentIndex = 0.obs;

  final pages = [
    const HomepageView(),
    MessageView(),
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
  }

  @override
  void onClose() {
    super.onClose();
  }
}
