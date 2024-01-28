import 'package:chat/app/controllers/auth_controller.dart';
import 'package:chat/app/data/models/auth_user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final authController = Get.find<AuthController>();

  GlobalKey<FormState> get formKey => _formKey;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;

  final RxBool _obscureText = true.obs;

  bool get obscureText => _obscureText.value;

  Future<void> login() async {
    if (_formKey.currentState!.validate()) {
      AuthUser? user = await authController.signIn(
        _emailController.text,
        _passwordController.text,
      );

      if (user != null) {
        // L'authentification a réussi, tu peux maintenant effectuer des actions avec l'utilisateur

        Get.offAllNamed('/home');
      } else {
        // L'authentification a échoué, gère cela en conséquence
        Get.snackbar(
          'Erreur',
          'Une erreur est survenue lors de la connexion',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
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
