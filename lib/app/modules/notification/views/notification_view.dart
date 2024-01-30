import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  const NotificationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NotificationView'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(index.toString()),
            child: ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text('Notification'),
              subtitle: const Text('Description de la notification'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Ajoutez ici la logique pour gérer les notifications
              },
            ),
            onDismissed: (direction) {
              // Ajoutez ici la logique pour supprimer une notification
              if (direction == DismissDirection.endToStart) {
                debugPrint('Suppression de la notification');
                Get.snackbar(
                  'Notification supprimée',
                  'La notification a été supprimée avec succès',
                  snackPosition: SnackPosition.BOTTOM,
                );
              } else {
                debugPrint('Marquage de la notification comme lue');
                Get.snackbar(
                  'Notification marquée comme lue',
                  'La notification a été marquée comme lue avec succès',
                  snackPosition: SnackPosition.BOTTOM,
                );
              }
            },
          );
        },
      ),
    );
  }
}
