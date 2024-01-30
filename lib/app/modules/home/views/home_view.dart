import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(
            left: 20,
          ),
          child: CircleAvatar(
            radius: 50,
            backgroundColor: Colors.white,
            foregroundColor: Colors.red,
            child: Image.asset(
              "assets/images/logo/logo.png",
              width: 70,
              height: 70,
            ),
          ),
        ),
        title: const Center(
          child: Text(
            "Explore",
            style: TextStyle(),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // Going to setting page
              Get.toNamed("/setting");
            },
            style: IconButton.styleFrom(
              backgroundColor: const Color(0x3A333333),
            ),
            icon: const Icon(
              Icons.settings,
            ),
          ),
          const SizedBox(height: 50),
        ],
      ),
      body: Obx(
        () => controller.pages[controller.currentIndex.value],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: (index) {
            switch (index) {
              case 0:
                // Return homepage
                debugPrint("Gesture tap to home");
                controller.currentIndex.value = index;
                break;
              case 1:
                debugPrint("Going to message page");
                // Going to message page
                Get.toNamed("/message");
                break;
              case 2:
                debugPrint("Going to friends page");
                // Going to friends page
                controller.currentIndex.value = index - 1;
                break;
              case 3:
                debugPrint("Going to notification page");
                // Going to  notification page
                controller.currentIndex.value = index - 1;
                break;
              default:
            }
          },
          items: const [
            BottomNavigationBarItem(
              backgroundColor: Color(0xFF1B3F99),
              icon: Icon(Icons.home),
              label: 'Accueil',
            ),
            BottomNavigationBarItem(
              backgroundColor: Color(0xFF1B3F99),
              icon: Icon(Icons.message),
              label: 'Messages',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.group,
              ),
              label: 'Amis',
              backgroundColor: Color(0xFF1B3F99),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notification_add),
              label: 'Notification',
              backgroundColor: Color(0xFF1B3F99),
            )
          ]),
    );
  }
}
