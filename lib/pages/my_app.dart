import 'package:flutter/material.dart';
import 'package:flutter_app_clinica_web/components/component/patient_component.dart';
import 'package:flutter_app_clinica_web/pages/auth_or_app_page.dart';
import 'package:flutter_app_clinica_web/pages/configuration_page.dart';
import 'package:flutter_app_clinica_web/pages/contact_page.dart';
import 'package:flutter_app_clinica_web/pages/patient_page.dart';
import 'package:flutter_app_clinica_web/pages/profile_page.dart';
import 'package:flutter_app_clinica_web/pages/schedule_page.dart';
import 'package:flutter_app_clinica_web/utils/app_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Projeto Clínica',
      theme: _myThemeData(),
      //home: const AuthOrAppPage(),
      routes: {
        AppRoutes.AUTH: (ctx) => const AuthOrAppPage(),
        AppRoutes.PATIENTS: (ctx) => const PatientPage(),
        AppRoutes.PATIENTS_ADD: (ctx) => const PatientComponent(),
        AppRoutes.PATIENTS_INFO: (ctx) => const PatientComponent(),
        AppRoutes.PATIENTS_EDIT: (ctx) => const PatientComponent(),
        AppRoutes.AGENDA: (ctx) => const SchedulePage(),
        AppRoutes.CONFIG: (ctx) => const ConfigurationPage(),
        AppRoutes.CONTACT: (ctx) => const ContactPage(),
        AppRoutes.PROFILE: (ctx) => const ProfilePage(),
      },
    );
  }

  static ThemeData _myThemeData() {
    return ThemeData(
      primarySwatch: Colors.blue,
    );
  }
}
