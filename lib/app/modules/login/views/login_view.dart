import 'package:chat/app/components/login_input.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                const SizedBox(height: 200),
                const Text(
                  'Connexion',
                  style: TextStyle(
                      fontSize: 31,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff1B3F99)),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 100),
                LoginInput(
                  label: "Email",
                  init: controller.userStorage.email ?? '',
                  type: TextInputType.emailAddress,
                  onTextChanged: (text) {
                    // Faire quelque chose avec le texte du mot de passe
                    controller.emailController.text = text;
                    print('Password changed: $text');
                  },
                ),
                const SizedBox(height: 20),
                LoginInput(
                  label: "Mot de passe",
                  init: controller.userStorage.password ?? '',
                  type: TextInputType.visiblePassword,
                  onTextChanged: (text) {
                    // Faire quelque chose avec le texte du mot de passe
                    controller.passwordController.text = text;
                    print('Password changed: $text');
                  },
                ),
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      // Add logic for "Mot de passe oublié"
                    },
                    child: const Text('Mot de passe oublié ?'),
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    // Add logic for "Connexion"
                    controller.login();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff1B3F99),
                    padding: const EdgeInsets.fromLTRB(40, 18, 40, 18),
                  ),
                  child: const Text(
                    'Connexion',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Connexion avec',
                  style: TextStyle(
                      fontSize: 1,
                      color: Color(0xff1B3F99),
                      fontStyle: FontStyle.italic),
                ),
                const SizedBox(height: 25),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.fromLTRB(40, 18, 40, 18),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/icons/google.png",
                        width: 30.0,
                        height: 30.0,
                      ),
                      const SizedBox(width: 20),
                      const Text(
                        'Google',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                const Text(
                  "Pas de compte ?",
                  style: TextStyle(
                    fontSize: 15,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Get.toNamed('/register');
                  },
                  child: const Text(
                    "S'inscrire",
                    style: TextStyle(
                      color: Color(0xff1B3F99),
                      fontSize: 15,
                      fontStyle: FontStyle.italic,
                      decoration: TextDecoration
                          .underline, // Souligner le texte pour indiquer que c'est un lien
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
