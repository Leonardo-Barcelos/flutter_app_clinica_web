import 'package:flutter/material.dart';
import 'package:flutter_app_clinica_web/components/forms/auth_form.dart';
import 'package:flutter_app_clinica_web/pages/loading_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  late bool _isLoading;
  @override
  Widget build(BuildContext context) {
    _isLoading = false;
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF8A2387),
              Color(0xFFE94057),
              Color(0xFFF27121),
            ],
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Visibility(
              visible: _isLoading,
              child: const LoadingPage(),
              replacement: const SingleChildScrollView(
                child: AuthForm(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
