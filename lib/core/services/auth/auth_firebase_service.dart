import 'dart:io';
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_app_clinica_web/core/models/user_model.dart';
import 'package:flutter_app_clinica_web/core/services/auth/auth_service.dart';

class AuthFirebaseService implements AuthService {
  static UserModel? _currentUser;

  static final _userStream = Stream<UserModel?>.multi((controller) async {
    final authChanges = FirebaseAuth.instance.authStateChanges();
    await for (final user in authChanges) {
      _currentUser = user == null ? null : _toChatUser(user);
      controller.add(_currentUser);
    }
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
      String name, String email, String password, File? image) async {
    final auth = FirebaseAuth.instance;
    UserCredential credential = await auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    if (credential.user == null) return;

    // 1. Upload da foto do usuário
    //final imageName = '${credential.user!.uid}.jpg';
    //final imageURL = await _uploadUserImage(image, imageName);

    // 2. atualizar os atributos do usuário
    await credential.user?.updateDisplayName(name);
    //await credential.user?.updatePhotoURL(imageURL);

    // 3. salvar usuário no banco de dados (opcional)
    _currentUser = _toChatUser(credential.user!, name);
    await _saveUser(_currentUser!);
  }

  @override
  Future<void> login(String email, String password) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> logout() async {
    FirebaseAuth.instance.signOut();
  }

  // ignore: unused_element
  Future<String?> _uploadUserImage(File? image, String imageName) async {
    if (image == null) return null;

    final storage = FirebaseStorage.instance;
    final imageRef = storage.ref().child('user_images').child(imageName);
    await imageRef.putFile(image).whenComplete(() {});
    return await imageRef.getDownloadURL();
  }

  Future<void> _saveUser(UserModel user) async {
    final store = FirebaseFirestore.instance;
    final docRef = store.collection('users').doc(user.id);

    return docRef.set({
      'name': user.name,
      'email': user.email,
      'imageURL': user.imageURL,
    });
  }

  static UserModel _toChatUser(User user, [String? name, String? imageURL]) {
    return UserModel(
      id: user.uid,
      name: name ?? user.displayName ?? user.email!.split('@')[0],
      email: user.email!,
      imageURL: '',
      type: '',
    );
  }
}
