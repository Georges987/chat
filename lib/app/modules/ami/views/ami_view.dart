import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/ami_controller.dart';

class AmiView extends GetView<AmiController> {
  const AmiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AmiView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AmiView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
