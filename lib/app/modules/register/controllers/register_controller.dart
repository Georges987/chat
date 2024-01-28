import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  bool isAccepted = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nomPrenomController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  GlobalKey<FormState> get formKey => _formKey;
  TextEditingController get nomPrenomController => _nomPrenomController;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;

  final count = 0.obs;
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

  void increment() => count.value++;
}
