//import 'package:exdesc_2025/Config/router/app_router.dart';
//import 'package:exdesc_2025/Config/theme/app_theme.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
//mport 'package:exdesc_2025/feature/presentation/blocs/username_cubit.dart';
//import 'package:exdesc_2025/config/router/app_router.dart'; // Aquí definís GoRouter
//import 'package:exdesc_2025/config/theme/app_theme.dart'; // Opcional
/*
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
 const MyApp({super.key});

 @override
  Widget build(BuildContext context) {
  return;
   // MultiBlocProvider(
     // providers: [BlocProvider(create: (_) => UsernameCubit())],
    //  child: MaterialApp.router(
    //    title: 'Flutter BLoC + Firebase',
    //    debugShowCheckedModeBanner: false,
     //   routerConfig: appRouter,
    //    theme: AppTheme(isDarkmode: false).getTheme(), // o ThemeData.light()
     // ),
   // );
  }
//}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final _navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static Widget create() {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSignedOut) {
          _navigatorKey.currentState?.pushNamedAndRemoveUntil(Routes.intro, (r) => false);
        } else if (state is AuthSignedIn) {
          _navigatorKey.currentState?.pushNamedAndRemoveUntil(Routes.home, (r) => false);
        }
      },
      child: const MyApp(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      title: 'Authentication Flow',
      onGenerateRoute: Routes.routes,
    );
  }
}*/
