import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app_clinica_web/core/models/patient_form_data.dart';
import 'package:flutter_app_clinica_web/core/models/patient_model.dart';
import 'package:flutter_app_clinica_web/core/services/patient/patient_service.dart';

class PatientFirebaseService implements PatientService {
  // ignore: prefer_final_fields
  List<PatientModel> _items = [];

  List<PatientModel> get items => [..._items];

  int get itemsCount {
    return _items.length;
  }

  //Função para criar um paciente
  @override
  Future<void> createPacient(PatientFormData patientForm) async {
    final store = FirebaseFirestore.instance;
    await store.collection('patients').add({
      'id': '',
      'name': patientForm.name,
      'adress': patientForm.adress,
      'rg': patientForm.rg,
      'cpf': patientForm.cpf,
      'phone': patientForm.phone,
    }).then((value) => {
          //Atualizo meu documento com o id criado;
          store.collection('patients').doc(value.id).update({
            'id': value.id,
          })
        });
  }

  @override
  Future<void> deletePacient(PatientModel patient) {
    throw UnimplementedError();
  }

  @override
  Future<void> getAllPacients() async {
    final store = FirebaseFirestore.instance;
    await store.collection('patients').get().then((value) => {
          // ignore: avoid_function_literals_in_foreach_calls
          if (value.docs.isNotEmpty)
            {
              value.docs.forEach((element) {
                _items.add(PatientModel(
                  id: element.data()['id'],
                  name: element.data()['name'],
                  adress: element.data()['adress'],
                  phone: element.data()['phone'],
                ));
              })
            }
        });
  }

  @override
  Future<PatientModel> getPacientById(PatientModel patient) async {
    final store = FirebaseFirestore.instance;
    // ignore: unused_local_variable
    final docRef = store.collection('patients').doc(patient.id);
    throw UnimplementedError();
  }

  @override
  Future<void> updatePacient(PatientFormData patientForm) {
    // TODO: implement updatePacient
    throw UnimplementedError();
  }
}
