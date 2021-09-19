import 'package:flutter_app_clinica_web/core/models/user_model.dart';
import 'package:flutter_app_clinica_web/core/services/user/user_service.dart';

// class UserFirebaseService implements UserService {
//   @override
//   Future<void> deleteUser() {
//     throw UnimplementedError();
//   }

//   @override
//   Future<void> getAllUsers() {
//     throw UnimplementedError();
//   }

//   @override
//   Future<void> getUserById() {
//     throw UnimplementedError();
//   }

//   @override
//   Future<void> saveUser(UserModel user) async {
//     final FirebaseFirestore db = FirebaseFirestore.instance; //Banco de dados
//     return db.collection('users').doc(user.id).set(
//       {
//         'id': user.id,
//         'name': user.name,
//         'email': user.email,
//         'type': user.type,
//       },
//     );
//   }

//   @override
//   Future<void> updateUser() {
//     // TODO: implement updateUser
//     throw UnimplementedError();
//   }

//   @override
//   // TODO: implement currentUser
//   UserModel? get currentUser => throw UnimplementedError();
// }
