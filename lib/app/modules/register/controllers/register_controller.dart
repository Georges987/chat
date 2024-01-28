import 'package:chat/app/controllers/auth_controller.dart';
import 'package:chat/app/controllers/user_storage.dart';
import 'package:chat/app/data/models/auth_user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final isAccepted = false.obs;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nomPrenomController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  GlobalKey<FormState> get formKey => _formKey;
  TextEditingController get nomPrenomController => _nomPrenomController;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;

  final authcontroller = Get.find<AuthController>();
  final user_storage = Get.put(UserStorage(), permanent: true);

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    _emailController.text = user_storage.email ?? '';
    _passwordController.text = user_storage.password ?? '';
    _nomPrenomController.text = user_storage.username ?? '';

    _emailController.addListener(() {
      user_storage.saveEmail(_emailController.text);
    });

    _passwordController.addListener(() {
      user_storage.savePassword(_passwordController.text);
    });

    _nomPrenomController.addListener(() {
      user_storage.saveUsername(_nomPrenomController.text);
    });
  }

  void register() async {
    if (_formKey.currentState!.validate()) {
      AuthUser? user = await authcontroller.signUp(
        _emailController.text,
        _passwordController.text,
      );

      Get.snackbar(
        'Inscription ${user!.displayName}',
        'Réussie',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  @override
  void onClose() {
    super.onClose();

    _emailController.dispose();
    _passwordController.dispose();
    _nomPrenomController.dispose();
  }
}
