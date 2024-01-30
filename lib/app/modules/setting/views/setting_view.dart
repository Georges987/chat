import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/setting_controller.dart';

class SettingView extends GetView<SettingController> {
  const SettingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Paramètres'),
        actions: [
          IconButton(
            color: Colors.white,
            iconSize: 25,
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Ajoutez ici la logique pour gérer les notifications
            },
          ),
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Mon compte'),
            onTap: () {
              // Ajoutez ici la logique pour gérer les notifications
            },
          ),
          ListTile(
            leading: const Icon(Icons.security),
            title: const Text('A propos'),
            onTap: () {
              // Ajoutez ici la logique pour gérer les notifications
            },
          ),
          ListTile(
            leading: const Icon(Icons.help),
            title: const Text('Aide'),
            onTap: () {
              // Ajoutez ici la logique pour gérer l'aide
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Déconnexion'),
            onTap: () {
              controller.logout();
            },
          ),
          // Section Compte
          // Section Générale et Social
        ],
      ),
    );
  }
}
