import 'package:flutter/material.dart';
import 'package:flutter_app_clinica_web/core/models/user_model.dart';
import 'package:flutter_app_clinica_web/core/services/auth/auth_service.dart';
import 'package:flutter_app_clinica_web/pages/auth_page.dart';
import 'package:flutter_app_clinica_web/pages/home_page.dart';
import 'package:flutter_app_clinica_web/pages/loading_page.dart';

import 'package:firebase_core/firebase_core.dart';

class AuthOrAppPage extends StatelessWidget {
  const AuthOrAppPage({Key? key}) : super(key: key);

  Future<void> init(BuildContext context) async {
    await Firebase.initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: init(context),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingPage();
        } else {
          return StreamBuilder<UserModel?>(
            stream: AuthService().userChanges,
            builder: (ctx, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return LoadingPage();
              } else {
                return snapshot.hasData ? HomePage() : AuthPage();
              }
            },
          );
          //return snapshot.hasData ? const HomePage() : const AuthPage();
        }
      },
    );
  }
}
