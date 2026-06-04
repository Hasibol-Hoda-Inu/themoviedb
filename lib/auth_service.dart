import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;

  Future<User?> signUp(String email, String pass) async {
    try {
      final userCred = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );
      return userCred.user;
    } on FirebaseAuthException {
      rethrow;
    }
  }

  Future<User?> login(String email, String pass) async {
    try {
      final userCred = await _auth.signInWithEmailAndPassword(
        email: email,
        password: pass,
      );
      return userCred.user;
    } on FirebaseAuthException {
      rethrow;
    }
  }

  Future<void> logout() async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException {
      rethrow;
    }
  }
}
