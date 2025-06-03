import 'package:exdesc_2025/feature/data/datesources/auth_datasuerce.dart';

import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDatasource datasource;

  AuthRepositoryImpl(this.datasource);

  @override
  Future<UserEntity> signIn(String email, String password) =>
      datasource.signIn(email, password);

  @override
  Future<UserEntity> signUp(String email, String password) =>
      datasource.signUp(email, password);

  @override
  Future<void> signOut() => datasource.signOut();
}
