import 'package:chat/app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
          child: ElevatedButton(
              onPressed: () {
                final authcontroller = Get.find<AuthController>();

                authcontroller.signOut();

                Get.showSnackbar(const GetSnackBar(
                  message: "Signed Out",
                  duration: Duration(seconds: 3),
                ));
              },
              child: const Icon(Icons.home))),
    );
  }
}
