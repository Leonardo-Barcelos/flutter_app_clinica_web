import 'package:flutter/material.dart';
import 'package:flutter_app_clinica_web/components/forms/patient_form.dart';
import 'package:flutter_app_clinica_web/core/models/patient_form_data.dart';

class PatientComponent extends StatelessWidget {
  const PatientComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Paciente'),
      ),
      body: SafeArea(
          child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: PatientForm(onSubmit: _handleSubmit),
        ),
      )),
    );
  }

  Future<void> _handleSubmit(PatientFormData formData) async {
    try {
      print('teste');
    } catch (e) {
    } finally {}
  }
}
