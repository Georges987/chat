import 'package:chat/app/components/login_input.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/post_controller.dart';

class PostView extends GetView<PostController> {
  const PostView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Faire un nouveau post'),
          centerTitle: true,
        ),
        body: Form(
            child: ListView(
          children: [
            LoginInput(
              label: "Contenu du post",
              init: "",
              type: TextInputType.text,
              onTextChanged: (value) => {
                controller.controller.text = value,
                debugPrint(controller.controller.text),
              },
            ),
            const SizedBox(height: 10),
            //image picker
            InkWell(
                onTap: () => {},
                child: const SizedBox(
                  height: 200,
                  width: 150,
                  child: Card(
                    child: Center(child: Text("Ajouter une image")),
                  ),
                )),
            ElevatedButton(
              onPressed: () => {},
              child: const Text("Publier"),
            ),
          ],
        )));
  }
}
