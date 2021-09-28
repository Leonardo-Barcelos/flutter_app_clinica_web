import 'package:flutter/material.dart';
import 'package:flutter_app_clinica_web/components/forms/patient_form.dart';
import 'package:flutter_app_clinica_web/core/models/patient_form_data.dart';
import 'package:flutter_app_clinica_web/core/models/patient_model.dart';

class PatientItem extends StatelessWidget {
  final String name;
  final PatientModel patient;
  const PatientItem({
    Key? key,
    required this.name,
    required this.patient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name),
      trailing: SizedBox(
        width: 145,
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.remove_red_eye),
              color: Theme.of(context).primaryColor,
              onPressed: () =>

                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) =>
                  //         PatientForm(onSubmit: _meuPacient, modo: PageMode.read),
                  //     fullscreenDialog: false,
                  //     maintainState: false,
                  //   ),
                  // );
                  Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) => RotaInfo(
                          patient: patient,
                        )),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.edit),
              color: Theme.of(context).primaryColor,
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const RotaEdit()),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              color: Theme.of(context).errorColor,
              onPressed: () {
                // ignore: avoid_print
                print('excluir');
                showDialog<bool>(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text('Excluir Paciente'),
                    content: const Text('Tem certeza?'),
                    actions: [
                      TextButton(
                        child: const Text('Não'),
                        onPressed: () => Navigator.of(ctx).pop(false),
                      ),
                      TextButton(
                        child: const Text('Sim'),
                        onPressed: () => Navigator.of(ctx).pop(true),
                      ),
                    ],
                  ),
                ).then((value) async {});
              },
            ),
          ],
        ),
      ),
    );
  }
}

class RotaInfo extends StatelessWidget {
  final PatientModel patient;
  const RotaInfo({
    Key? key,
    required this.patient,
  }) : super(key: key);
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
          child: PatientForm(
            onSubmit: _handleSubmit,
          ),
        ),
      )),
    );
  }

  void _handleSubmit(PatientFormData formData) {}
}

class RotaEdit extends StatelessWidget {
  const RotaEdit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Segunda Rota (tela)"),
      ),
      body: const Center(),
    );
  }
}
