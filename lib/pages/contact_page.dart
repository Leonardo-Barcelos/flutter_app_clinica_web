import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Contato com o desenvolvedor'),
      ),
      body: const SizedBox(
        child: Center(
          child: Text('Em construção...'),
        ),
      ),
    );
  }
}
