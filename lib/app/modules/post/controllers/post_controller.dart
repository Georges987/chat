import 'dart:io';

import 'package:chat/app/controllers/online_database_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class PostController extends GetxController {
  final permission = false.obs;

  final TextEditingController _controller = TextEditingController();

  final database = Get.put(OnlineDatabaseController());

  TextEditingController get controller => _controller;

  Future<void> checkStoragePermission() async {
    if (await Permission.storage.isGranted) {
      permission.value = true;
    } else if (await Permission.storage.isPermanentlyDenied) {
      openAppSettings();
      update();
      permission.value = false;
    } else {
      permission.value = false;
    }
  }

  Rx<File?> imageFile = Rx<File?>(null);

  // Fonction pour obtenir une image depuis la galerie
  Future<void> getImage() async {
    try {
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      if (pickedFile == null) {
        return;
      }

      // Convertit le chemin de l'image en objet File
      File imageFile = File(pickedFile.path);

      // Vérifie si le fichier existe réellement
      if (await imageFile.exists()) {
        // Mets à jour le contrôleur avec l'image sélectionnée
        this.imageFile.value = imageFile;
      } else {
        // Le fichier n'existe pas
        Get.snackbar('Fichier inexistant', 'Impossible de récupérer l\'image.');
      }
    } catch (e) {
      // Gère les erreurs potentielles
      debugPrint('Erreur lors de la récupération de l\'image : $e');
    }
  }

  Future<void> post() async {
    if (permission.value) {
      if (controller.text.isEmpty) {
        Get.snackbar("Post vide", "Ajoutez une description à votre post");
        return;
      }
      if (imageFile.value != null) {
        await database.addPost(_controller.text, imageFile.value!);
      } else {
        Get.snackbar(
            "Absence d'image", "Veuillez ajouter une image à votre post");
      }
      Get.back();
    } else {
      Get.snackbar("Permission refusée",
          "Vous devez autoriser l'accès au stockage pour pouvoir poster une image");
      openAppSettings();
    }
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    debugPrint("Post Controller is ready");
    await checkStoragePermission();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
