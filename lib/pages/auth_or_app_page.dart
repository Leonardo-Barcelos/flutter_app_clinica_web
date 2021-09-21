import 'package:flutter/material.dart';
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
          return snapshot.hasData ? const HomePage() : const AuthPage();
        }
      },
    );
  }
}
