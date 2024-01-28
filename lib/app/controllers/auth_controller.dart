import 'package:chat/app/controllers/user_storage.dart';
import 'package:chat/app/data/models/auth_user_model.dart';
import 'package:chat/app/services/auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  //TODO: Implement AuthController

  final AuthService _authService = AuthService();

  final RxBool _obscureText = true.obs;

  bool get obscureText => _obscureText.value;

  void changeObscureText() {
    _obscureText.value = !_obscureText.value;
  }

  final user_storage = Get.put(UserStorage());

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

  void signUp(String email, String password) async {
    AuthUser? user = await _authService.signUp(email, password);
    if (user != null) {
      // Utilisateur enregistré avec succès
    } else {
      // Erreur lors de l'enregistrement
    }
  }

  Future<AuthUser?> signIn(String email, String password) async {
    AuthUser? user = await _authService.signIn(email, password);
    if (user != null) {
      // Utilisateur connecté avec succès
      user_storage.saveUser(user.displayName!, user.email!, password);
      return user;
    } else {
      // Erreur lors de la connexion
      return user;
    }
  }

  void signOut() async {
    await _authService.signOut();
  }

  // Méthode pour vérifier l'état de l'authentification
  Stream<User?> get authStateChanges => _authService.authStateChanges;
}
