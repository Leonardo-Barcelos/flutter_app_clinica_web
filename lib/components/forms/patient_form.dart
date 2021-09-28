import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_clinica_web/core/models/patient_form_data.dart';

class PatientForm extends StatefulWidget {
  final void Function(PatientFormData) onSubmit;
  const PatientForm({
    Key? key,
    required this.onSubmit,
  }) : super(key: key);

  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<PatientForm> {
  final _formKey = GlobalKey<FormState>();
  final _formData = PatientFormData();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      key: const ValueKey('nome'),
                      initialValue: _formData.name,
                      onChanged: (_name) => _formData.name = _name,
                      decoration: const InputDecoration(
                        labelText: 'Nome',
                        prefixIcon: Icon(Icons.person),
                      ),
                      keyboardType: TextInputType.name,
                      validator: (_name) {
                        final name = _name ?? '';
                        if (name.trim().length < 5) {
                          return 'Nome deve ter no mínimo 5 caracteres.';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      key: const ValueKey('rg'),
                      initialValue: _formData.rg,
                      onChanged: (_rg) => _formData.rg = _rg,
                      decoration: const InputDecoration(
                        labelText: 'RG',
                        prefixIcon: Icon(Icons.person),
                      ),
                      validator: (_rg) {
                        final rg = _rg ?? '';
                        if (rg.trim().length < 5) {
                          return 'Nome deve ter no mínimo 5 caracteres.';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      key: const ValueKey('cpf'),
                      initialValue: _formData.cpf,
                      onChanged: (_cpf) => _formData.cpf = _cpf,
                      decoration: const InputDecoration(
                        labelText: 'CPF',
                        prefixIcon: Icon(Icons.person),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (_cpf) {
                        final cpf = _cpf ?? '';
                        if (cpf.trim().length < 5) {
                          return 'Nome deve ter no mínimo 5 caracteres.';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      key: const ValueKey('telefone'),
                      initialValue: _formData.phone,
                      onChanged: (_phone) => _formData.phone = _phone,
                      decoration: const InputDecoration(
                        labelText: 'Telefone',
                        prefixIcon: Icon(Icons.phone),
                      ),
                      keyboardType: TextInputType.phone,
                      validator: (_phone) {
                        final phone = _phone ?? '';
                        if (phone.trim().length < 5) {
                          return 'Nome deve ter no mínimo 5 caracteres.';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      key: const ValueKey('endereço'),
                      initialValue: _formData.adress,
                      onChanged: (_adress) => _formData.adress = _adress,
                      decoration: const InputDecoration(
                        labelText: 'Endereço',
                        prefixIcon: Icon(Icons.place),
                      ),
                      keyboardType: TextInputType.streetAddress,
                      validator: (_adress) {
                        final adress = _adress ?? '';
                        if (adress.trim().length < 5) {
                          return 'Nome deve ter no mínimo 5 caracteres.';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
            child: _botao(),
          ),
        ],
      ),
    );
  }

  Widget _botao() {
    return ElevatedButton(
      child: Text(
        _formData.isCreate ? 'Cadastrar' : 'Atualizar',
        style: const TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: _submit,
    );
  }

  void _showMessage(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: Colors.blue,
      ),
    );
  }

  void _submit() {
    final isValid = _formKey.currentState?.validate() ?? false;
    if (!isValid) return;

    widget.onSubmit(_formData);
    return _showMessage('Sucesso');
  }
}
