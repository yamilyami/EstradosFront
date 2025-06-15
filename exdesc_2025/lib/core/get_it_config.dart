// lib/injection_container.dart
//import 'package:exdesc_2025/feature/data/datasources/auth_datasource.dart';
import 'package:exdesc_2025/feature/data/datesources/auth_datasuerce.dart';
import 'package:exdesc_2025/feature/data/repositories/auth_repository_impl.dart';
import 'package:exdesc_2025/feature/domain/repositories/auth_repository.dart';
import 'package:exdesc_2025/feature/domain/use_cases/sign_in.dart';
import 'package:exdesc_2025/feature/presentation/blocs/auth_bloc.dart';

import 'package:exdesc_2025/feature/data/repositories/cards_repository_impl.dart';
import 'package:exdesc_2025/feature/domain/repositories/cards_repository.dart';
import 'package:exdesc_2025/feature/domain/use_cases/get_all_cards_usecase.dart';
import 'package:exdesc_2025/feature/presentation/blocs/card_bloc.dart';

import 'package:get_it/get_it.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final sl = GetIt.instance;

void configureGetItApp() {
  // External
  sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);

  // AuthDatasource concreto (NO interfaz)
  sl.registerLazySingleton<AuthDatasource>(() => AuthDatasource());

  // Auth
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));
  sl.registerLazySingleton(() => SignIn(sl()));
  sl.registerFactory(() => AuthBloc(signIn: sl()));

  // Cartas
  sl.registerLazySingleton<CardsRepository>(() => CardsRepositoryImpl(sl()));
  sl.registerLazySingleton(() => GetAllCardsUseCase(sl()));
  sl.registerFactory(() => CardsBloc(sl()));
}

/*import 'package:exdesc_2025/feature/data/repositories/cards_repository_impl.dart';
import 'package:exdesc_2025/feature/domain/repositories/cards_repository.dart';
import 'package:exdesc_2025/feature/domain/use_cases/get_all_cards_usecase.dart';
import 'package:exdesc_2025/feature/domain/use_cases/sign_in.dart';
import 'package:exdesc_2025/feature/presentation/blocs/card_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:exdesc_2025/feature/data/repositories/auth_repository_impl.dart';
import 'package:exdesc_2025/feature/domain/repositories/auth_repository.dart';
//import 'package:exdesc_2025/feature/domain/usecases/sign_in.dart';
import 'package:exdesc_2025/feature/presentation/blocs/auth_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// NUEVO: imports para cartas
//import 'package:exdesc_2025/feature/cards/data/repositories/cards_repository_impl.dart';
//import 'package:exdesc_2025/feature/cards/domain/repositories/cards_repository.dart';
//import 'package:exdesc_2025/feature/cards/domain/usecases/get_all_cards_usecase.dart';
//import 'package:exdesc_2025/feature/cards/presentation/bloc/cards_bloc.dart';

final sl = GetIt.instance;

void configureGetItApp() {
  // External
  sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

  // Auth
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));
  sl.registerLazySingleton(() => SignIn(sl()));
  sl.registerFactory(() => AuthBloc(signIn: sl()));

  sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);
  sl.registerLazySingleton<CardsRepository>(() => CardsRepositoryImpl(sl()));
  sl.registerLazySingleton(() => GetAllCardsUseCase(sl()));
  sl.registerFactory(() => CardsBloc(sl()));
}
*/
/*import 'package:exdesc_2025/feature/domain/use_cases/sign_in.dart';
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
}*/
