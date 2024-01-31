import 'package:chat/app/controllers/auth_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class OnlineDatabaseController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> addPostWithImage(String post, String image) async {
    await firestore.collection("posts").add({
      "post": post,
      "image": image,
      "uid": Get.find<AuthController>().user?.uid ?? "",
      "time": DateTime.now(),
    });
  }

  Future<void> addPostWithoutImage(String post) async {
    await firestore.collection("posts").add({
      "post": post,
      "uid": Get.find<AuthController>().user?.uid ?? "",
      "time": DateTime.now(),
    });
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
