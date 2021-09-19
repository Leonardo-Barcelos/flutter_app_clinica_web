import 'package:flutter/material.dart';
import 'package:flutter_app_clinica_web/pages/auth_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '',
      theme: _myThemeData(),
      home: const AuthPage(),
    );
  }

  static ThemeData _myThemeData() {
    return ThemeData(
      primarySwatch: Colors.blue,
    );
  }
}
