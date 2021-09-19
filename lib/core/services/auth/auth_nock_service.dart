import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter_app_clinica_web/core/models/user_model.dart';
import 'package:flutter_app_clinica_web/core/services/auth/auth_service.dart';

class AuthMockService implements AuthService {
  static const _defaultUser = UserModel(
    id: '456',
    name: 'Ana',
    email: 'ana@cod3r.com.br',
    imageURL: 'assets/images/avatar.png',
    type: '',
  );

  static final Map<String, UserModel> _users = {
    _defaultUser.email: _defaultUser,
  };
  static UserModel? _currentUser;
  static MultiStreamController<UserModel?>? _controller;
  static final _userStream = Stream<UserModel?>.multi((controller) {
    _controller = controller;
    _updateUser(_defaultUser);
  });

  @override
  UserModel? get currentUser {
    return _currentUser;
  }

  @override
  Stream<UserModel?> get userChanges {
    return _userStream;
  }

  @override
  Future<void> signup(
    String name,
    String email,
    String password,
    File? image,
  ) async {
    final newUser = UserModel(
      id: Random().nextDouble().toString(),
      name: name,
      email: email,
      imageURL: image?.path ?? 'assets/images/avatar.png',
      type: '',
    );

    _users.putIfAbsent(email, () => newUser);
    _updateUser(newUser);
  }

  @override
  Future<void> login(String email, String password) async {
    _updateUser(_users[email]);
  }

  @override
  Future<void> logout() async {
    _updateUser(null);
  }

  static void _updateUser(UserModel? user) {
    _currentUser = user;
    _controller?.add(_currentUser);
  }
}
