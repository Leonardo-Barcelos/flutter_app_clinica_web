import 'package:flutter/material.dart';
import 'package:flutter_app_clinica_web/components/component/patient_item.dart';
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
            children: [
              const PatientItem(name: 'Leonardo Peixoto'),
              const PatientItem(name: 'Henrique da Silva'),
              const PatientItem(name: 'Claudia Araia '),
              const PatientItem(name: 'Fernanda Monte Negro'),
              const PatientItem(name: 'Ben Daniels'),
              const PatientItem(name: 'Marco Aurelio de Souza'),
              const PatientItem(name: 'Pedro Paulo da Silva Junior'),
              const PatientItem(name: 'Pedro de Alcântara Francisco'),
              const PatientItem(name: 'Antônio João Carlos Xavier de Paula'),
              const PatientItem(name: 'Serafim de Bragança e Bourbon'),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoutes.PATIENTS_ADD);
                },
                child: const Text('Adicionar paciente'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
