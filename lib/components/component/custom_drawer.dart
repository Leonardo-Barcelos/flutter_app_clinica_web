import 'package:flutter/material.dart';
import 'package:flutter_app_clinica_web/core/models/user_model.dart';
import 'package:flutter_app_clinica_web/core/services/auth/auth_service.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserModel? _currentUser = AuthService().currentUser;
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/user_image.png'),
                maxRadius: 50,
              ),
            ),
            Text(_currentUser!.name),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Informações'),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.manage_accounts),
              title: const Text('Configurações'),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Sair'),
              onTap: () => AuthService().logout(),
            ),
          ],
        ),
      ),
    );
  }
}
