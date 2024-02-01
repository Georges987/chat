import 'package:chat/app/components/post_card.dart';
import 'package:chat/app/modules/home/controllers/home_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HomepageView extends GetView<HomeController> {
  const HomepageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 10),
          StreamBuilder(
            stream: FirebaseFirestore.instance.collection('posts').snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Erreur: ${snapshot.error}');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator(); // Affiche un indicateur de chargement pendant la récupération des données
              }

              // Affiche la liste des posts à partir des données Firestore
              return Column(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data() as Map<String, dynamic>;

                  // Assure-toi d'ajuster les noms de champs en fonction de ta structure de données
                  String postContent = data['post'] ?? '';
                  String imageUrl = data['image'] ?? '';
                  String uid = data['uid'] ?? '';
                  Timestamp time = data['time'] ?? '';

                  return PostCard(
                    post: postContent,
                    image: imageUrl,
                    uid: uid,
                    time: time,
                  );
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}
