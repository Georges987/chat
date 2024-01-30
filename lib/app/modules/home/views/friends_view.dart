import 'package:flutter/material.dart';

import 'package:get/get.dart';

class FriendsView extends GetView {
  const FriendsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FriendsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'FriendsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
