
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get getCurrentUser => _firebaseAuth.currentUser;

  Future createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    return await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password
    );
  }

  Future signInWithEmailAndPassword(
      {required String email, required String password}) async {
    await _firebaseAuth
        .signInWithEmailAndPassword(
        email: email,
        password: password
    );
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}