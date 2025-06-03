import 'package:exdesc_2025/feature/domain/use_cases/sign_in.dart';
import 'package:get_it/get_it.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:exdesc_2025/feature/data/repositories/auth_repository_impl.dart';
import 'package:exdesc_2025/feature/domain/repositories/auth_repository.dart';
//import 'package:exdesc_2025/feature/domain/usecases/sign_in.dart';
import 'package:exdesc_2025/feature/presentation/blocs/auth_bloc.dart';

final sl = GetIt.instance; // sl = service locator

void configureGetItApp() {
  // External
  sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

  // Data
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));

  // Domain
  sl.registerLazySingleton(() => SignIn(sl()));

  // Bloc
  sl.registerFactory(() => AuthBloc(signIn: sl()));
}
