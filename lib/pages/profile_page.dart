import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Perfil'),
      ),
      body: const SizedBox(
        child: Center(
          child: Text('Em construção...'),
        ),
      ),
    );
  }
}
