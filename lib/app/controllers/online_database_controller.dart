import 'dart:io';

import 'package:chat/app/data/models/auth_user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:chat/app/controllers/auth_controller.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class OnlineDatabaseController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addPost(String post, File image) async {
    try {
      // Vérifie si l'utilisateur est connecté
      AuthUser? user = Get.find<AuthController>().user;
      if (user == null) {
        // L'utilisateur n'est pas connecté, gère cette situation comme nécessaire
        return;
      }

      // Génère un ID unique pour le post
      String postId = firestore.collection('posts').doc().id;

      // Télécharge l'image sur Firebase Storage et récupère l'URL
      String? imageUrl = await uploadImageToStorage(postId, image);

      // Ajoute le post à Firestore avec l'URL de l'image
      if (imageUrl != null) {
        await firestore.collection('posts').doc(postId).set({
          'post': post,
          'image': imageUrl,
          'uid': user.uid,
          'time': FieldValue.serverTimestamp(),
        }, SetOptions(merge: true));

        // Affiche un message de succès ou fait d'autres actions nécessaires
        Get.snackbar('Succès', 'Le post a été ajouté avec succès');
        Get.offAndToNamed('/home');
      } else {
        // Gère les erreurs potentielles lors de l'ajout du post
        debugPrint('Erreur lors de l\'ajout du post : $imageUrl');
        Get.snackbar(
            'Erreur', 'Une erreur s\'est produite lors de l\'ajout du post');
      }
    } catch (e) {
      // Gère les erreurs potentielles lors de l'ajout du post
      debugPrint('Erreur lors de l\'ajout du post : $e');
      Get.snackbar(
          'Erreur', 'Une erreur s\'est produite lors de l\'ajout du post');
    }
  }

  Future<String?> uploadImageToStorage(String postId, File image) async {
    try {
      // Emplacement dans Firebase Storage où l'image sera stockée
      String storagePath =
          'posts/$postId/${DateTime.now().millisecondsSinceEpoch}.jpg';

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

  Future<void> addComment(String comment, String postId) async {
    await firestore.collection("comments").add({
      "comment": comment,
      "uid": Get.find<AuthController>().user?.uid ?? "",
      "postId": postId,
      "time": DateTime.now(),
    });
  }

  Future<void> addLike(String postId) async {
    await firestore.collection("likes").add({
      "uid": Get.find<AuthController>().user?.uid ?? "",
      "postId": postId,
      "time": DateTime.now(),
    });
  }

  Future<void> removeLike(String postId) async {
    await firestore
        .collection("likes")
        .where("uid", isEqualTo: Get.find<AuthController>().user?.uid ?? "")
        .where("postId", isEqualTo: postId)
        .get()
        .then((value) {
      for (var element in value.docs) {
        element.reference.delete();
      }
    });
  }

  Future<void> addUserToFirestore(String uid, String name, String email) async {
    try {
      await FirebaseFirestore.instance.collection('users').doc(uid).set({
        'uid': uid,
        'name': name,
        'email': email,
      }, SetOptions(merge: true));
    } catch (e) {
      debugPrint('Erreur lors de l\'ajout de l\'utilisateur à Firestore : $e');
    }
  }
}
