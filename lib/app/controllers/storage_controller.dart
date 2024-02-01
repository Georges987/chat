import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class StorageController extends GetxController {
  Future<bool> checkStoragePermission() async {
    if (await Permission.storage.isGranted) {
      return true;
    } else if (await Permission.storage.isPermanentlyDenied) {
      openAppSettings();
      update();
      return false;
    } else {
      return false;
    }
  }

  Future<String?> uploadImageToStorage(String postId, File image) async {
    try {
      // Emplacement dans Firebase Storage où l'image sera stockée
      String storagePath =
          '$postId/${DateTime.now().millisecondsSinceEpoch}.jpg';

      // Référence à l'emplacement dans Firebase Storage
      Reference storageReference = FirebaseStorage.instance.ref(storagePath);

      // Télécharge le fichier image sur Firebase Storage
      await storageReference.putFile(image);

      // Récupère l'URL de l'image téléchargée
      String imageUrl = await storageReference.getDownloadURL();

      // Retourne l'URL de l'image
      return imageUrl;
    } catch (e) {
      // Gère les erreurs potentielles lors du téléchargement de l'image
      debugPrint('Erreur lors du téléchargement de l\'image : $e');
      return null;
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
}
