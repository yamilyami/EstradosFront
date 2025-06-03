import 'package:exdesc_2025/core/routes/app_routes.dart';
import 'package:exdesc_2025/feature/presentation/blocs/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'firebase_options.dart';
//import 'package:get_it/get_it.dart';

import 'core/get_it_config.dart';
//import 'feature/presentation/blocs/auth_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  configureGetItApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (_) => GetIt.instance<AuthBloc>(),
        ), //sl<AuthBloc>())
      ],
      child: MaterialApp(
        title: 'ExDes',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRouter.generateRoute,
        initialRoute: '/',
      ),
    );
  }
}

/* actualizado a 17 de mayo
import 'package:exdesc_2025/feature/presentation/screens/login_screens.dart';
import 'package:exdesc_2025/feature/presentation/screens/resgiter_screen.dart';
import 'package:exdesc_2025/feature/presentation/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ExDes',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => RegisterScreen(),
      },
    );
  }
}
*/
//import 'package:exdesc_2025/Config/app.dart';
//import 'package:flutter/material.dart';
//import 'package:firebase_core/firebase_core.dart';
//import 'firebase_options.dart';

//anda con fire base y da el alta de usuario
//void main() async {
//WidgetsFlutterBinding.ensureInitialized();
//await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
//runApp(const MyApp());
//}
/*
//separo en app...si falla borrar app
import 'package:exdesc_2025/auth/login_screen.dart';
import 'package:exdesc_2025/auth/register_screen.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prueba a fire',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        // '/': (context) => const Home(),
        '/Login': (context) => const LoginScreen(),
        '/Register': (context) => RegisterScreen(),
      },
      //  home: Home(),
      ///// home: Scaffold(
      //    appBar: Home()),
    );
  }
}*/
