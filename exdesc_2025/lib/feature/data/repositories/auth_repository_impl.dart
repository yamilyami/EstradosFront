// lib/feature/data/repositories/auth_repository_impl.dart
//import 'package:exdesc_2025/feature/data/datasources/auth_datasource.dart';
import 'package:exdesc_2025/feature/data/datesources/auth_datasuerce.dart';
import 'package:exdesc_2025/feature/domain/repositories/auth_repository.dart';
import 'package:exdesc_2025/feature/data/model/user_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDatasource datasource;

  AuthRepositoryImpl(this.datasource);

  @override
  Future<UserModel> signIn(String email, String password) {
    return datasource.signIn(email, password);
  }

  @override
  Future<UserModel> signUp(String email, String password) {
    return datasource.signUp(email, password);
  }

  @override
  Future<void> signOut() {
    return datasource.signOut();
  }
}
