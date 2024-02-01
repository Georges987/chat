import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../controllers/status_show_controller.dart';

class StatusShowView extends GetView<StatusShowController> {
  const StatusShowView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StatusShowView'),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              controller.image.value,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Obx(
                  () => Text(controller.post.value),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.comment),
                    ),
                    IconButton(
                      onPressed: () {
                        showBottomSheet(
                          context: context,
                          builder: (context) => StreamBuilder(
                            stream: FirebaseFirestore.instance
                                .collection('comments')
                                .where("postId",
                                    isEqualTo: controller.postId.value)
                                .snapshots(),
                            builder: (BuildContext context,
                                AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (snapshot.hasError) {
                                return Text('Erreur: ${snapshot.error}');
                              }

                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const CircularProgressIndicator(); // Affiche un indicateur de chargement pendant la récupération des données
                              }

                              // Affiche la liste des posts à partir des données Firestore
                              return Column(
                                children: snapshot.data!.docs
                                    .map((DocumentSnapshot document) {
                                  Map<String, dynamic> data =
                                      document.data() as Map<String, dynamic>;

                                  // Assure-toi d'ajuster les noms de champs en fonction de ta structure de données
                                  String content = data['comment'] ?? '';
                                  String uid = data['uid'] ?? '';
                                  Timestamp time = data['time'] ?? '';
                                  final username = "".obs;

                                  FirebaseFirestore.instance
                                      .collection('users')
                                      .where('uid', isEqualTo: uid)
                                      .get()
                                      .then((value) =>
                                          value.docs.forEach((element) {
                                            debugPrint(element.data()['name']);
                                            username.value =
                                                element.data()['name'];
                                          }));

                                  String formatTimeDifference(
                                      DateTime timestamp) {
                                    final now = DateTime.now();
                                    final difference =
                                        now.difference(timestamp);

                                    if (difference.inDays > 0) {
                                      return DateFormat('dd MMM').format(
                                          timestamp); // Affiche la date si la différence est d'au moins un jour
                                    } else if (difference.inHours > 0) {
                                      return '${difference.inHours}h ago';
                                    } else if (difference.inMinutes > 0) {
                                      return '${difference.inMinutes}m ago';
                                    } else {
                                      return 'Just now';
                                    }
                                  }

                                  return ListTile(
                                    title: Column(
                                      children: [
                                        Text(username.value),
                                        Text(content),
                                      ],
                                    ),
                                    isThreeLine: true,
                                    subtitle: Text(
                                      formatTimeDifference(time.toDate()),
                                      style: const TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  );
                                }).toList(),
                              );
                            },
                          ),
                        );
                      },
                      icon: const Icon(Icons.favorite),
                    )
                  ],
                ),
                TextField(
                  controller: controller.controller,
                  decoration: InputDecoration(
                      fillColor: Colors.transparent,
                      labelText: "Ajoutez un commentaire",
                      suffix: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.send),
                      )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
