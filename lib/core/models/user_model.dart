enum UserType { comun, medico, admin }

extension UserTypeDescription on UserType {
  String get description {
    switch (this) {
      case UserType.comun:
        return 'Comum';
      case UserType.medico:
        return 'Medico';
      case UserType.admin:
        return 'Administrador';
    }
  }
}

class UserModel {
  final String id;
  final String name;
  final String email;
  final String imageURL;
  final String type;

  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.imageURL,
    required this.type,
  });
}
