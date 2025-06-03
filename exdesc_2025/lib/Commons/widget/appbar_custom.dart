import 'package:flutter/material.dart';

class CustomAppbar extends AppBar {
  CustomAppbar({super.key});

  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Rick and Morty'),
      centerTitle: true,
      backgroundColor: Colors.deepPurple,
      elevation: 10.0,
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.exit_to_app),
        ),
      ],
    );
  }
}
