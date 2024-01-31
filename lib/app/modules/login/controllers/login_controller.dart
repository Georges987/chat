import 'package:chat/app/controllers/auth_controller.dart';
import 'package:chat/app/controllers/user_storage.dart';
import 'package:chat/app/data/models/auth_user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final authController = Get.find<AuthController>();
  final userStorage = Get.put(UserStorage());

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
        userStorage.saveUser(
          user.displayName!,
          user.email!,
        );
        Get.offAllNamed('/home');
      } else {
        // L'authentification a échoué, gère cela en conséquence
        Get.snackbar(
          'Erreur de connexion',
          'Votre email ou mot de passe est incorrect',
          snackPosition: SnackPosition.BOTTOM,
          icon: const Icon(Icons.error),
          duration: const Duration(seconds: 5),
          isDismissible: true,
          dismissDirection: DismissDirection.horizontal,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
    _emailController.text = userStorage.email ?? '';
    _passwordController.text = userStorage.password ?? '';
  }

  @override
  void onReady() {
    super.onReady();

    _emailController.addListener(() {
      userStorage.saveEmail(_emailController.text);
    });

    _passwordController.addListener(() {
      userStorage.savePassword(_passwordController.text);
    });
  }

  @override
  void onClose() {
    super.onClose();
    _emailController.dispose();
    _passwordController.dispose();

    _obscureText.close();
  }
}
