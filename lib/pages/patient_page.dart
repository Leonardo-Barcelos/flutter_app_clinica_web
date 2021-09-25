import 'package:flutter/material.dart';
import 'package:flutter_app_clinica_web/components/component/patient_component.dart';
import 'package:flutter_app_clinica_web/utils/app_routes.dart';

class PatientPage extends StatefulWidget {
  const PatientPage({Key? key}) : super(key: key);

  @override
  _PatientPageState createState() => _PatientPageState();
}

class _PatientPageState extends State<PatientPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Pacientes'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes.PATIENTS_ADD);
                },
                child: Text('Adicionar paciente'),
              ),
              ListTile(
                leading: Text('Ola'),
              ),
              ListTile(
                leading: Text('Ola'),
              ),
              ListTile(
                leading: Text('Ola'),
              ),
              ListTile(
                leading: Text('Ola'),
              ),
              ListTile(
                leading: Text('Ola'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
