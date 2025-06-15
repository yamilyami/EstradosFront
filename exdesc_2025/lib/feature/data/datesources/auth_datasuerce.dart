// lib/feature/data/datasources/auth_datasource.dart
import 'package:exdesc_2025/feature/data/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthDatasource {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserModel> signIn(String email, String password) async {
    final result = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return UserModel.fromFirebase(result.user!);
  }

  Future<UserModel> signUp(String email, String password) async {
    final result = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return UserModel.fromFirebase(result.user!);
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
