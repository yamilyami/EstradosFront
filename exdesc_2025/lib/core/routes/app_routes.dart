import 'package:exdesc_2025/feature/presentation/screens/DashBoard_screen.dart';
import 'package:flutter/material.dart';
import 'package:exdesc_2025/feature/presentation/screens/login_screens.dart';
import 'package:exdesc_2025/feature/presentation/screens/resgiter_screen.dart';
import 'package:exdesc_2025/feature/presentation/screens/welcome_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case '/login':
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case '/register':
        return MaterialPageRoute(builder: (_) => RegisterScreen());
      case '/home':
        return MaterialPageRoute(builder: (_) => const DashboardPage());
      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(
                  child: Text('Ruta no encontrada: ${settings.name}'),
                ),
              ),
        );
    }
  }
}
