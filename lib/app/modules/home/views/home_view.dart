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
              "Chat T",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                // Going to setting page
                Get.toNamed("/setting");
              },
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
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            selectedItemColor: Colors.blue[700],
            unselectedItemColor: Colors.black,
            currentIndex: controller.currentIndex.value,
            onTap: (val) {
              controller.changeIndex(val);
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.message),
                label: "Messages",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.people),
                label: "Amis",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications),
                label: "Notifications",
              ),
            ],
          ),
        ));
  }
}
