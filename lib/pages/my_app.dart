import 'package:flutter/material.dart';
import 'package:flutter_app_clinica_web/pages/auth_or_app_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Projeto Clínica',
      theme: _myThemeData(),
      home: const AuthOrAppPage(),
    );
  }

  static ThemeData _myThemeData() {
    return ThemeData(
      primarySwatch: Colors.blue,
    );
  }
}
