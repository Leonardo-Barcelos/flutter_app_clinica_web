enum AuthMode { create, update }

class PatientFormData {
  String name = '';
  String rg = '';
  String cpf = '';
  String phone = '';
  String adress = '';
  AuthMode _mode = AuthMode.create;

  bool get isCreate {
    return _mode == AuthMode.create;
  }

  bool get isUpdate {
    return _mode == AuthMode.update;
  }

  void toggleAuthMode() {
    _mode = isCreate ? AuthMode.update : AuthMode.create;
  }
}
