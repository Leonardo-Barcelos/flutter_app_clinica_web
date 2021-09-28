import 'package:flutter/material.dart';
import 'package:flutter_app_clinica_web/components/component/patient_item.dart';
import 'package:flutter_app_clinica_web/core/models/patient_model.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class PatientPage extends StatefulWidget {
  const PatientPage({Key? key}) : super(key: key);

  @override
  _PatientPageState createState() => _PatientPageState();
}

class _PatientPageState extends State<PatientPage> {
  //Pegando direto do firebase
  //! Corrigir depois para passar pelo service;
  var snapshots = FirebaseFirestore.instance
      .collection('patients')
      .orderBy('name') //Ordenando pelo nome
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Pacientes'),
      ),
      body: body(),
    );
  }

  Widget body() {
    return StreamBuilder(
      stream: snapshots,
      builder: (BuildContext ctx, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.data!.docs.isEmpty) {
          return const Center(child: Text('Nenhuma tarefa ainda'));
        }
        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          itemBuilder: (BuildContext context, int i) {
            var doc = snapshot.data!.docs[i];
            //var item = doc.data;
            PatientModel patientWeb = PatientModel(
              id: doc['id'],
              name: doc['name'],
              adress: doc['adress'],
              phone: doc['phone'],
            );

            return Column(
              children: [
                const Divider(),
                PatientItem(
                  name: doc['name'],
                  patient: patientWeb,
                ),
                const Divider(),
              ],
            );
          },
        );
      },
    );
  }
}
