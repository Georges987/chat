import 'package:chat/app/controllers/auth_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class MessageView extends GetView {
  MessageView({Key? key}) : super(key: key);

  final users = FirebaseFirestore.instance.collection('users').snapshots();

  final user = Get.find<AuthController>().user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Messages'),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: users,
          builder: ((context, snapshot) {
            if (snapshot.hasError) {
              Get.snackbar('Error', 'Error while loading data');
              return const Center(
                child: Text('Error while loading data'),
              );
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return ListView(
                children: snapshot.data!.docs.map<Widget>((doc) {
              if (doc['uid'] != user?.uid) {
                return ListTile(
                  title: Text(
                    doc['name'],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(doc['email']),
                  trailing: const Icon(Icons.message),
                  onTap: () {
                    Get.toNamed('/dicussion', parameters: {
                      'receiverEmail': doc['email'],
                      'receiverId': doc['uid'],
                      'receiverName': doc['name'],
                    });
                  },
                );
              } else {
                return const SizedBox();
              }
            }).toList());
          }),
        ));
  }
}
