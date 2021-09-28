enum PageMode { read, create, update }

class PatientFormData {
  String name = '';
  String rg = '';
  String cpf = '';
  String phone = '';
  String adress = '';
  PageMode _mode = PageMode.create;

  bool get isCreate {
    return _mode == PageMode.create;
  }

  bool get isUpdate {
    return _mode == PageMode.update;
  }

  bool get isRead {
    return _mode == PageMode.read;
  }

  void toggleAuthMode() {
    _mode = isCreate ? PageMode.update : PageMode.create;
  }
}
