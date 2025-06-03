import 'package:exdesc_2025/feature/presentation/blocs/auth_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      body: Center(
        child:
            isSmallScreen
                ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [_LogoWidget(), _LoginForm()],
                )
                : Container(
                  padding: const EdgeInsets.all(32.0),
                  constraints: const BoxConstraints(maxWidth: 800),
                  child: Row(
                    children: const [
                      Expanded(child: _LogoWidget()),
                      Expanded(child: Center(child: _LoginForm())),
                    ],
                  ),
                ),
      ),
    );
  }
}

class _LogoWidget extends StatelessWidget {
  const _LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset('lib/assets/Logo.png'),
        const SizedBox(height: 16),
        Text(
          "Bienvenidos a ExDes!",
          textAlign: TextAlign.center,
          style:
              isSmallScreen
                  ? Theme.of(
                    context,
                  ).textTheme.headlineLarge?.copyWith(color: Colors.black)
                  : Theme.of(
                    context,
                  ).textTheme.headlineMedium?.copyWith(color: Colors.black),
        ),
      ],
    );
  }
}

class _LoginForm extends StatefulWidget {
  const _LoginForm({super.key});

  @override
  State<_LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;
  bool _rememberMe = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 300),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _emailController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Ingrese su correo';
                }
                final bool isValidEmail = RegExp(
                  r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
                ).hasMatch(value);
                if (!isValidEmail) return 'Correo inválido';
                return null;
              },
              decoration: const InputDecoration(
                labelText: 'Correo electrónico',
                prefixIcon: Icon(Icons.email_outlined),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _passwordController,
              obscureText: !_isPasswordVisible,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Ingrese su contraseña';
                }
                if (value.length < 6) {
                  return 'Debe tener al menos 6 caracteres';
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: 'Contraseña',
                prefixIcon: const Icon(Icons.lock_outline),
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
            CheckboxListTile(
              value: _rememberMe,
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    _rememberMe = value;
                  });
                }
              },
              title: const Text('Recordarme'),
              controlAffinity: ListTileControlAffinity.leading,
              contentPadding: EdgeInsets.zero,
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _handleLogin,
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    'Iniciar sesión',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: const Text('¿No tenés cuenta? Registrate'),
            ),
          ],
        ),
      ),
    );
  }

  void _handleLogin() {
    if (_formKey.currentState?.validate() ?? false) {
      final email = _emailController.text;
      final password = _passwordController.text;

      // Despacha el evento SignInRequested con el email y la contraseña
      context.read<AuthBloc>().add(SignInRequested(email, password));
    }
  }
}


 // void _handleLogin() {
 //   if (_formKey.currentState?.validate() ?? false) {
 //     final email = _emailController.text;
   //   final password = _passwordController.text;

      // Aquí podrías llamar a un provider, bloc o controlador de clean architecture
  //    print("Login con: $email, $password, Recordarme: $_rememberMe");

      // Por ahora, solo navega al home (de ejemplo):
   //   Navigator.pushReplacementNamed(context, '/home');
  //  }
 // }

