import 'package:chat/app/data/models/auth_user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Méthode pour s'inscrire
  Future<AuthUser?> signUp(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = result.user;
      return user != null
          ? AuthUser(uid: user.uid, email: user.email ?? '')
          : null;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // Méthode pour se connecter
  Future<AuthUser?> signIn(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = result.user;
      return user != null
          ? AuthUser(uid: user.uid, email: user.email ?? '')
          : null;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // Méthode pour se déconnecter
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // Méthode pour vérifier l'état de l'authentification
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // Méthode pour récupérer l'utilisateur connecté
  User? get currentUser => _auth.currentUser;

  // Méthode pour vérifier si l'utilisateur est connecté
  bool get isAuth => _auth.currentUser != null;
}
