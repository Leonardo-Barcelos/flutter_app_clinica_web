import 'package:flutter_app_clinica_web/core/models/user_model.dart';
import 'package:flutter_app_clinica_web/core/services/user/user_firebase_service.dart';

abstract class UserService {
  Future<void> getAllUsers();
  Future<void> getUserById();
  Future<void> saveUser(UserModel user);
  Future<void> updateUser();
  Future<void> deleteUser();

  factory UserService() {
    return UserFirebaseService();
  }
}
