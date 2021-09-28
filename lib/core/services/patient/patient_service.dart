import 'package:flutter_app_clinica_web/core/models/patient_form_data.dart';
import 'package:flutter_app_clinica_web/core/models/patient_model.dart';
import 'package:flutter_app_clinica_web/core/services/patient/patient_firebase_service.dart';

abstract class PatientService {
  Future<void> createPacient(PatientFormData patientFormData);
  Future<PatientModel> getPacientById(PatientModel patient);
  Future<void> getAllPacients();
  Future<void> updatePacient(PatientFormData patientForm);
  Future<void> deletePacient(PatientModel patient);

  factory PatientService() => PatientFirebaseService();
}
