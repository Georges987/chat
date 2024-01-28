import 'package:chat/env.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/logo/logo.png',
            width: 200.0,
            height: 200.0,
          ),
          const SizedBox(height: 20.0),
          const Text(
            APP_NAME,
            style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Obx(
            () => Text(
              controller.version.value,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.normal,
              ),
            ),
          )
        ],
      ),
    ));
  }
}
