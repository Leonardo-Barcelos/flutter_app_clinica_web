import 'dart:io';
import 'dart:async';

import 'package:flutter_app_clinica_web/core/models/user_model.dart';
import 'package:flutter_app_clinica_web/core/services/auth/auth_service.dart';

class AuthMockService implements AuthService {
  static final _defaultUser = UserModel(
    id: '456',
    name: 'Ana',
    email: 'ana@cod3r.com.br',
    imageURL: 'assets/images/avatar.png',
    type: UserType.comun.description,
  );

  static Map<String, UserModel> _users = {
    _defaultUser.email: _defaultUser,
  };
  static UserModel? _currentUser;
  static MultiStreamController<UserModel?>? _controller;
  static final _userStream = Stream<UserModel?>.multi((controller) {
    _controller = controller;
    _updateUser(_defaultUser);
  });

  UserModel? get currentUser {
    return _currentUser;
  }

  Stream<UserModel?> get userChanges {
    return _userStream;
  }

  Future<void> login(String email, String password) async {
    _updateUser(_users[email]);
  }

  Future<void> logout() async {
    _updateUser(null);
  }

  static void _updateUser(UserModel? user) {
    _currentUser = user;
    _controller?.add(_currentUser);
  }

  @override
  Future<void> signup(
      String name, String email, String password, File? image, String? type) {
    // TODO: implement signup
    throw UnimplementedError();
  }
}
