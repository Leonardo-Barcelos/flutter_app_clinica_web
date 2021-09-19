import 'dart:io';
import 'package:flutter_app_clinica_web/core/models/user_model.dart';

abstract class AuthService {
  UserModel? get currentUser;

  Stream<UserModel?> get userChanges;

  Future<void> signup(
    String name,
    String email,
    String password,
    File? image,
  );

  Future<void> login(
    String email,
    String password,
  );

  Future<void> logout();

  // factory AuthService() {

  //   //return AuthFirebaseService();
  // }
}
