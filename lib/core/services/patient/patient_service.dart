import 'package:flutter_app_clinica_web/core/models/patient_model.dart';
import 'package:flutter_app_clinica_web/core/services/patient/patient_firebase_service.dart';

abstract class PatientService {
  Future<void> createPacient(PatientModel patient);
  Future<void> getPacientById(PatientModel patient);
  Future<void> getAllPacients();
  Future<void> updatePacient(PatientModel patient);
  Future<void> deletePacient(PatientModel patient);

  factory PatientService() => PatientFirebaseService();
}
