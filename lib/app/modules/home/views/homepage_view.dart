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
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(10, (index) {
                return Container(
                  margin: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(80, 122, 139, 185),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: InkWell(
                    onTap: () {
                      // Going to message page
                    },
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Image.asset(
                        "assets/images/content/avatar.png",
                      ),
                    ),
                  ),
                );
              }),
            ),
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
