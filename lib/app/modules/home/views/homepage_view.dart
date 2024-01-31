import 'package:chat/app/components/post_card.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HomepageView extends GetView {
  const HomepageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                    'https://images.unsplash.com/photo-1622835047087-4b3b0f5b5b0f?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Y2hhdCUyMGJhY2tncm91bmQlMjBzdG9yZXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80'),
              ),
              const SizedBox(width: 10),
              Text(
                controller.user!.email,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
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
