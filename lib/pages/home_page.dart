import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:flutter_app_clinica_web/components/component/item_overview.dart';
import 'package:flutter_app_clinica_web/core/services/auth/auth_service.dart';
import 'package:flutter_app_clinica_web/utils/app_routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      appBar: AppBar(
        title: const Text('Projeto Clínica'),
        centerTitle: true,
      ),
      sideBar: _sideBar(context),
      body: _myBody(context),
    );
  }

  Widget _myBody(BuildContext context) {
    return GridView(
        padding: const EdgeInsets.all(10.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 100 / 50,
        ),
        children: const [
          ItemOverview(
            name: 'Agenda',
            image: 'assets/calendar.png',
            routeName: AppRoutes.AGENDA,
          ),
          ItemOverview(
            name: 'Consultas hoje',
            image: 'assets/consult.png',
          ),
          ItemOverview(
            name: 'Pacientes',
            image: 'assets/person.png',
            routeName: AppRoutes.PATIENTS,
          ),
          ItemOverview(
            name: 'Adicionar Paciente',
            image: 'assets/person_add.png',
            routeName: AppRoutes.PATIENTS_ADD,
          )
        ]);
  }

  SideBar _sideBar(BuildContext context) {
    return SideBar(
      backgroundColor: const Color.fromARGB(1, 254, 254, 254),
      //iconColor: const Color.fromRGBO(80, 80, 80, 100),
      textStyle:
          const TextStyle(color: Color.fromRGBO(80, 80, 80, 100), fontSize: 12),
      selectedRoute: '/',
      items: const [
        MenuItem(
          title: 'Perfil',
          route: AppRoutes.PROFILE,
          icon: Icons.person,
        ),
        MenuItem(
          title: 'Contato',
          route: AppRoutes.CONTACT,
          icon: Icons.info,
        ),
        MenuItem(
          title: 'Configurações',
          route: AppRoutes.CONFIG,
          icon: Icons.settings,
        ),
      ],
      onSelected: (item) {
        //config
        if (item.route == AppRoutes.CONFIG) {
          Navigator.of(context).pushNamed(AppRoutes.CONFIG);
        }
        //contato
        if (item.route == AppRoutes.CONTACT) {
          Navigator.of(context).pushNamed(AppRoutes.CONTACT);
        }
        //perfil
        if (item.route == AppRoutes.PROFILE) {
          Navigator.of(context).pushNamed(AppRoutes.PROFILE);
        }
      },
      header: Container(
        height: 50,
        width: double.infinity,
        color: const Color.fromARGB(1, 254, 254, 254),
        child: const Image(
          image: AssetImage('assets/user_image.png'),
          fit: BoxFit.fitHeight,
        ),
      ),
      footer: ListTile(
        leading: const Icon(Icons.exit_to_app),
        title: const Text('SAIR'),
        onTap: () {
          AuthService().logout();
        },
      ),
    );
  }
}
