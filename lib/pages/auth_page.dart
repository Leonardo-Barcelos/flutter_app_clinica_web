import 'package:flutter/material.dart';
import 'package:flutter_app_clinica_web/components/forms/auth_form.dart';
import 'package:flutter_app_clinica_web/core/models/auth_form_data.dart';
import 'package:flutter_app_clinica_web/core/services/auth/auth_service.dart';
import 'package:flutter_app_clinica_web/pages/loading_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  late bool _isLoading;

  Future<void> _handleSubmit(AuthFormData formData) async {
    try {
      setState(() => _isLoading = true);

      if (formData.isLogin) {
        // Login
        await AuthService().login(
          formData.email,
          formData.password,
        );
      } else {
        // Signup
        await AuthService().signup(
          formData.name,
          formData.email,
          formData.password,
          formData.image,
        );
      }
    } catch (error) {
      // Tratar erro!
    } finally {
      setState(() => _isLoading = false);
    }
  }

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
              replacement: SingleChildScrollView(
                child: AuthForm(onSubmit: _handleSubmit),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
