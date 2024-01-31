import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/dicussion_controller.dart';

class DicussionView extends GetView<DicussionController> {
  const DicussionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(controller.receiverName ?? ''),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: _messageList(),
            ),
            _inputMessage(),
          ],
        ));
  }

  Widget _messageList() {
    return StreamBuilder(
        stream: controller.getMessages(
          controller.receriverId!,
          controller.auth.currentUser!.uid,
        ),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView(
              children: snapshot.data!.docs.map<Widget>((doc) {
                return _messageCard(doc);
              }).toList(),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Widget _messageCard(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    var alignment = data['senderId'] != controller.receriverId
        ? Alignment.centerRight
        : Alignment.centerLeft;

    var color =
        data['senderId'] != controller.receriverId ? Colors.blue : Colors.white;

    return Container(
        margin: const EdgeInsets.all(8),
        alignment: alignment,
        child: Card(
            color: color,
            child: Padding(
                padding: const EdgeInsets.all(8), child: Text(data['text']))));
  }

  Widget _inputMessage() {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: controller.messageController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                labelText: 'Message',
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: () {
            controller.send();
          },
          icon: const Icon(Icons.send),
        ),
      ],
    );
  }
}
