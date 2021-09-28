import 'package:flutter/material.dart';
import 'package:flutter_app_clinica_web/components/forms/patient_form.dart';
import 'package:flutter_app_clinica_web/core/models/patient_form_data.dart';

import 'package:flutter_app_clinica_web/core/services/patient/patient_service.dart';
import 'package:flutter_app_clinica_web/pages/auth_page.dart';
import 'package:flutter_app_clinica_web/pages/loading_page.dart';

class PatientComponent extends StatefulWidget {
  const PatientComponent({
    Key? key,
    PatientFormData? patientForm,
    AuthPage? modePage,
  }) : super(key: key);

  @override
  State<PatientComponent> createState() => _PatientComponentState();
}

class _PatientComponentState extends State<PatientComponent> {
  bool _isLoading = false;
  PatientFormData form = PatientFormData();
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !_isLoading,
      replacement: const LoadingPage(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Paciente'),
        ),
        body: SafeArea(
            child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: PatientForm(
              onSubmit: _handleSubmit,
            ),
          ),
        )),
      ),
    );
  }

  Future<void> _handleSubmit(PatientFormData formData) async {
    try {
      setState(() => _isLoading = true);
      if (formData.isRead) {
        // ignore: avoid_print
        print('modo leitura');
      }

      if (formData.isCreate) {
        await PatientService().createPacient(formData);
      }

      if (formData.isUpdate) {
        // ignore: avoid_print
        print('modo update');
      }
    } catch (e) {
      // ignore: avoid_print
      print('Error');
    } finally {
      setState(() => _isLoading = false);
    }
  }
}
