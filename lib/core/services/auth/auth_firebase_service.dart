import 'dart:io';

import 'package:flutter_app_clinica_web/core/models/user_model.dart';
import 'package:flutter_app_clinica_web/core/services/auth/auth_service.dart';
import 'package:flutter_app_clinica_web/core/services/user/user_service.dart';

// class AuthFirebaseService implements AuthService {
//   static UserModel? _currentUser;

//   static final _userStream = Stream<UserModel>.multi((controller) async {
//     final authChanges = FirebaseAuth.instance.authStateChanges();

//     await for (final user in authChanges) {
//       _currentUser = user == null ? null : _toUserModel(user);
//       controller.add(_currentUser!);
//     }
//   });

//   @override
//   UserModel? get currentUser {
//     return _currentUser;
//   }

//   @override
//   Stream<UserModel> get userChanges => _userStream;

//   @override
//   Future<void> login(
//     String email,
//     String password,
//   ) {
//     throw UnimplementedError();
//   }

//   @override
//   Future<void> logout() async => FirebaseAuth.instance.signOut();

//   @override
//   Future<void> signup(
//     String name,
//     String email,
//     String password,
//     File? image,
//     String? type,
//   ) async {
//     final auth = FirebaseAuth.instance;
//     UserCredential credential = await auth.createUserWithEmailAndPassword(
//         email: email, password: password);

//     if (credential.user == null) return;

//     // 1. Upload da foto do usuário
//     final imageName = '${credential.user!.uid}.jpg';
//     final imageURL = await _uploadUserImage(image, imageName);

//     // 2. atualizar os atributos do usuário
//     await credential.user?.updateDisplayName(name);
//     await credential.user?.updatePhotoURL(imageURL);

//     // 3. salvar usuário no banco de dados (opcional)
//     _currentUser = _toUserModel(credential.user!, name);
//     await UserService().saveUser(_currentUser!);
//   }

//   static UserModel _toUserModel(User user,
//       [String? name, String? imageURL, String? tipo]) {
//     //Fazer tratamento aqui recuperar o numero do tipo do médico pela lista
//     return UserModel(
//       id: user.uid,
//       name: user.displayName ?? user.email!.split('@')[0],
//       email: user.email!,
//       imageURL: imageURL ?? user.photoURL ?? 'assets/images/avatar.png',
//       type: tipo ?? UserType.comun.description, //TESTE
//     );
//   }

//   Future<String?> _uploadUserImage(File? image, String imageName) async {
//     if (image == null) return null;

//     final storage = FirebaseStorage.instance;
//     final imageRef = storage.ref().child('user_images').child(imageName);
//     await imageRef.putFile(image).whenComplete(() {});
//     return await imageRef.getDownloadURL();
//   }
// }
