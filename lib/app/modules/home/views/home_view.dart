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
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: SizedBox(
          height: 56.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  // Naviguer vers la page "Home"
                  controller.changeIndex(0);
                },
                icon: const Icon(Icons.home),
              ),
              IconButton(
                onPressed: () {
                  // Naviguer vers la page "Messages"
                  controller.changeIndex(1);
                },
                icon: const Icon(Icons.message),
              ),
              IconButton(
                onPressed: () {
                  // Naviguer vers la page "Amis"
                  controller.changeIndex(2);
                },
                icon: const Icon(Icons.people),
              ),
              IconButton(
                onPressed: () {
                  // Naviguer vers la page "Notifications"
                  controller.changeIndex(3);
                },
                icon: const Icon(Icons.notifications),
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => {Get.toNamed('/post')},
        child: const Icon(Icons.add),
      ),
    );
  }
}
