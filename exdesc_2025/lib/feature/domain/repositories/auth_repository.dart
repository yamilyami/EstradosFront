import '../entities/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity> signIn(String email, String password);
  Future<UserEntity> signUp(String email, String password);
  Future<void> signOut();
}

///
/*typedef UserUID = String;

abstract class AuthRepository {
  Stream<UserUID?> get onAuthStateChanged;

  Future<void> signOut();
}
*/
