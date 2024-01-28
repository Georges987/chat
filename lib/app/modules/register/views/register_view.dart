import 'package:chat/app/components/login_input.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RegisterView'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: controller.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 25),
                  const Text(
                    'INSCRIPTION',
                    style: TextStyle(
                        fontSize: 31,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff1B3F99)),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 25),
                  LoginInput(
                    label: "Nom",
                    type: TextInputType.name,
                    onTextChanged: (text) {
                      controller.nomPrenomController.text = text;
                      debugPrint('Name changed: $text');
                    },
                  ),
                  const SizedBox(height: 30),
                  LoginInput(
                    label: "Email",
                    type: TextInputType.emailAddress,
                    onTextChanged: (text) {
                      controller.emailController.text = text;
                      debugPrint('Email changed: $text');
                    },
                  ),
                  const SizedBox(height: 30),
                  LoginInput(
                    label: "Mot de pass",
                    type: TextInputType.visiblePassword,
                    onTextChanged: (text) {
                      controller.passwordController.text = text;
                      debugPrint('Password changed: $text');
                    },
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Obx(
                        () => Checkbox(
                          value: controller.isAccepted.value,
                          onChanged: (value) {
                            controller.isAccepted.value = value!;
                          },
                        ),
                      ),
                      const Text('Lu et approuvé Service & Condition'),
                    ],
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      if (controller.formKey.currentState!.validate() &&
                          controller.isAccepted.value) {
                        controller.register();
                      } else {
                        Get.snackbar(
                          'Erreur',
                          'Veuillez accepter les conditions',
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.red,
                          colorText: Colors.white,
                        );
                      }
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
                        fontSize: 16,
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
                    "Pas de compte ? S’inscrire",
                    style: TextStyle(
                      color: Color(0xff1B3F99),
                      fontStyle: FontStyle.italic,
                      decoration: TextDecoration
                          .underline, // Souligner le texte pour indiquer que c'est un lien
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
