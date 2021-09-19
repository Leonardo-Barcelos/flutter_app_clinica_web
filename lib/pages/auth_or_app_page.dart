import 'package:flutter/material.dart';
import 'package:flutter_app_clinica_web/core/models/user_model.dart';
import 'package:flutter_app_clinica_web/core/services/auth/auth_service.dart';
import 'package:flutter_app_clinica_web/pages/auth_page.dart';
import 'package:flutter_app_clinica_web/pages/home_page.dart';
import 'package:flutter_app_clinica_web/pages/loading_page.dart';

class AuthOrAppPage extends StatelessWidget {
  const AuthOrAppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<UserModel?>(
        stream: AuthService().userChanges,
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingPage();
          } else {
            return snapshot.hasData ? const HomePage() : const AuthPage();
          }
        },
      ),
    );
  }
}
