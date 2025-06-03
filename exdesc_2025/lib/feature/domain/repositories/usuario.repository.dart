//import 'package:dartz/dartz.dart';
//import 'package:exdesc_2025/core/error/fallures.dart';
//import 'package:exdesc_2025/feature/domain/entities/usuarios_screen.dart';
/*
abstract class UsuarioRepository {
  Future<Either<Failure, UsuariosScreen>> getUsuariosScreen(int id);
  Future<Either<Failure, bool>> buscarScreen(UsuariosScreen usuario);
  Future<Either<Failure, List<UsuariosScreen>>> getUsuariosList(int id);
}
*/
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:exdesc_2025/auth/login_screen.dart';
//import 'package:exdesc_2025/auth/register_screen.dart';
///import 'package:exdesc_2025/pages/home_pages.dart';
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
        //'/': (context) => const Home(),
        //'/Login': (context) => const LoginScreen(),
        //'/Register': (context) => RegisterScreen(),
      },
      //  home: Home(),
      ///// home: Scaffold(
      //    appBar: Home()),
    );
  }
}

FirebaseFirestore db = FirebaseFirestore.instance;
/*
//sign con credednciales
Future<void> singInWithCredentials(String email, String password) {
  return db.singInWithEmailAndPassword(email: email, password: password);
}
// registro
Future
Future<List> getUsuario() async {
  List usuario = [];
  CollectionReference collectionReferenceUsuario = db.collection('usuarioDB');
  QuerySnapshot queryUsuario = await collectionReferenceUsuario.get();
  queryUsuario.docs.forEach((documento) {
    usuario.add(documento.data());
  });
  return usuario;
}

Future<void> addUsuario(String name) async {
  await db.collection('usuarioDB').add({'name': name});
}
*/
