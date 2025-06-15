import 'package:flutter/material.dart';

class UserCardsPage extends StatelessWidget {
  const UserCardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mis Cartas')),
      body: const Center(
        child: Text('Aquí se mostrarán las cartas compradas por el usuario'),
      ),
    );
  }
}
