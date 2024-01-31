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
                onTap: () async {
                  // Appelle la fonction pour obtenir une image
                  await controller.getImage();
                },
                child: const SizedBox(
                  height: 200,
                  width: 150,
                  child: Card(
                    child: Center(
                        child: Column(
                      children: [
                        Text("Ajouter une image"),
                        Icon(Icons.add_a_photo),
                      ],
                    )),
                  ),
                )),

            Obx(
              () {
                // Affiche l'image si elle existe
                if (controller.imageFile.value != null) {
                  return Image.file(controller.imageFile.value!);
                } else {
                  // Affiche un message ou un espace réservé si aucune image n'est sélectionnée
                  return const Text('Aucune image sélectionnée');
                }
              },
            ),
            ElevatedButton(
              onPressed: () => controller.post(),
              child: const Text("Publier"),
            ),
          ],
        )));
  }
}
