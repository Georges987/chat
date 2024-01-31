import 'package:chat/app/components/post_card.dart';
import 'package:chat/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HomepageView extends GetView<HomeController> {
  const HomepageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 10),
          ElevatedButton(
              onPressed: () => {Get.toNamed('/post')},
              child: const Text("Ajouter une nouvelle publication")),
          const SizedBox(height: 10),
          Column(
            children: List.generate(10, (index) {
              return const PostCard();
            }),
          ),
        ],
      ),
    );
  }
}
