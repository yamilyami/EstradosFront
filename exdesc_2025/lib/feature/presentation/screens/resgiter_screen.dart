//import 'package:exdesc_2025/feature/domain/repositories/usuario.repository.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  // Controllers para los campos
  final nombreController = TextEditingController();
  final apellidoController = TextEditingController();
  final aliasController = TextEditingController();
  final paisController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final rolController = TextEditingController(); // Jugador, Juez, etc.

  String avatarUrl = ""; // podrías usar esto con un picker

  // Función de registro
  Future<void> registerUser() async {
    try {
      // 1. Crear cuenta en Firebase Auth
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          );

      String uid = userCredential.user!.uid;

      // 2. Crear documento en Firestore
      await FirebaseFirestore.instance.collection('usuarios').doc(uid).set({
        'nombre': nombreController.text.trim(),
        'apellido': apellidoController.text.trim(),
        'alias': aliasController.text.trim(),
        'pais': paisController.text.trim(),
        'email': emailController.text.trim(),
        'foto': avatarUrl,
        'rol': rolController.text.trim().toLowerCase(),
        'cartas': [],
        'juegos_ganados': 0,
        'juegos_perdidos': 0,
        'torneos_ganados': 0,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Usuario registrado correctamente')),
      );

      // Redirigir o limpiar formulario
    } catch (e) {
      print('Error al registrar: $e');
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error: ${e.toString()}')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registro de Usuario')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: nombreController,
                decoration: InputDecoration(labelText: 'Nombre'),
              ),
              TextFormField(
                controller: apellidoController,
                decoration: InputDecoration(labelText: 'Apellido'),
              ),
              TextFormField(
                controller: aliasController,
                decoration: InputDecoration(labelText: 'Alias'),
              ),
              TextFormField(
                controller: paisController,
                decoration: InputDecoration(labelText: 'País'),
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(labelText: 'Contraseña'),
                obscureText: true,
              ),
              TextFormField(
                controller: rolController,
                decoration: InputDecoration(
                  labelText: 'Rol (jugador/juez/organizador/admin)',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: registerUser,
                child: Text('Registrarse'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


/*tiene el form complerto
import 'package:exdesc_2025/feature/domain/repositories/usuario.repository.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController(text: "");
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      body: Center(
        child:
            isSmallScreen
                ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const _Logo(),
                    FormContent(
                      nameController: nameController,
                      emailController: emailController,
                      passwordController: passwordController,
                      confirmPasswordController: confirmPasswordController,
                    ),
                  ],
                )
                : Container(
                  padding: const EdgeInsets.all(32.0),
                  constraints: const BoxConstraints(maxWidth: 800),
                  child: Row(
                    children: [
                      const Expanded(child: _Logo()),
                      Expanded(
                        child: Center(
                          child: FormContent(
                            nameController: nameController,
                            emailController: emailController,
                            passwordController: passwordController,
                            confirmPasswordController:
                                confirmPasswordController,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isSmallScreen = MediaQuery.of(context).size.width < 600;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 200,
          width: 200,
          child: Image.asset('lib/assets/Logo.png'),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "Registrate en ExDes!",
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
        ),
      ],
    );
  }
}

class FormContent extends StatefulWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  const FormContent({
    Key? key,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
  }) : super(key: key);

  @override
  State<FormContent> createState() => _FormContentState();
}

class _FormContentState extends State<FormContent> {
  bool _isPasswordVisible = false;
  bool _rememberMe = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
              controller: widget.nameController,
              decoration: const InputDecoration(
                labelText: 'Nombre completo',
                hintText: 'Ingrese su nombre completo',
                prefixIcon: Icon(Icons.person_outline),
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese su nombre';
                }
                return null;
              },
            ),
            _gap(),
            TextFormField(
              controller: widget.emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                hintText: 'Ingrese su email',
                prefixIcon: Icon(Icons.email_outlined),
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor ingrese su email';
                }
                bool emailValid = RegExp(
                  r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
                ).hasMatch(value);
                if (!emailValid) {
                  return 'Ingresar email válido';
                }
                return null;
              },
            ),
            _gap(),
            TextFormField(
              controller: widget.passwordController,
              obscureText: !_isPasswordVisible,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Crear password',
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
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Ingresar password';
                }
                if (value.length < 6) {
                  return 'Mínimo 6 caracteres';
                }
                return null;
              },
            ),
            _gap(),
            TextFormField(
              controller: widget.confirmPasswordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Confirmar Password',
                hintText: 'Repetir password',
                prefixIcon: Icon(Icons.lock_reset_outlined),
                border: OutlineInputBorder(),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Confirmar su password';
                }
                if (value != widget.passwordController.text) {
                  return 'Las contraseñas no coinciden';
                }
                return null;
              },
            ),
            _gap(),
            CheckboxListTile(
              value: _rememberMe,
              onChanged: (value) {
                if (value == null) return;
                setState(() {
                  _rememberMe = value;
                });
              },
              title: const Text('Términos y condiciones'),
              controlAffinity: ListTileControlAffinity.leading,
              dense: true,
              contentPadding: const EdgeInsets.all(0),
            ),
            _gap(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    final name = widget.nameController.text;
                    //final email = widget.emailController.text;
                    //final pass = widget.passwordController.text;

                    // ✅ Aquí llamás a tu función de guardado
                    addUsuario(name);

                    // Ejemplo: mostrar Snackbar (opcional)
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Usuario registrado')),
                    );
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Registrar',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _gap() => const SizedBox(height: 16);
}
*/