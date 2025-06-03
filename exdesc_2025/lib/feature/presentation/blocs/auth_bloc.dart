import 'package:exdesc_2025/feature/domain/entities/user_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:exdesc_2025/feature/domain/use_cases/sign_in.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignIn signIn;

  AuthBloc({required this.signIn}) : super(AuthInitial()) {
    on<SignInRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = await signIn(event.email, event.password);
        emit(AuthSuccess(user));
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });
  }
}

/*import 'package:equatable/equatable.dart';
import 'package:exdesc_2025/feature/domain/entities/user_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {

final ///agregar caso de uso intanciar segun el evento segun resp....emite 
  AuthBloc({required this.firebaseAuth}) : super(AuthInitial()) {
    // Aquí definís los handlers de eventos
  }
}*/

/*import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:exdesc_2025/feature/domain/entities/user_entity.dart';
import 'package:exdesc_2025/feature/domain/use_cases/sign_in.dart';
import 'package:exdesc_2025/feature/domain/use_cases/sing_up.dart';

//import '../../../domain/entities/user_entity.dart';
//import '../../../domain/usecases/sign_in.dart';
//import '../../../domain/usecases/sign_up.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignIn signIn;
  final SignUp signUp;

  AuthBloc({required this.signIn, required this.signUp})
    : super(AuthInitial()) {
    on<SignInRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = await signIn(event.email, event.password);
        emit(AuthSuccess(user));
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });

    on<SignUpRequested>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = await signUp(event.email, event.password);
        emit(AuthSuccess(user));
      } catch (e) {
        emit(AuthFailure(e.toString()));
      }
    });
  }
}*/
