import 'package:flutter/material.dart';
import 'package:flutter_app_clinica_web/components/component/custom_drawer.dart';
import 'package:flutter_app_clinica_web/core/models/user_model.dart';
import 'package:flutter_app_clinica_web/core/services/auth/auth_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserModel? _currentUser = AuthService().currentUser;
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(_currentUser!.name),
              const Text('tela home'),
            ],
          ),
        ),
      ),
      endDrawer: const CustomDrawer(),
    );
  }
}
