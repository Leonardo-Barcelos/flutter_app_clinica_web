import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:flutter_app_clinica_web/components/component/item_overview.dart';
import 'package:flutter_app_clinica_web/utils/app_routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      appBar: AppBar(title: const Text('Projeto Clínica')),
      sideBar: _sideBar(context),
      body: _myBody(),
    );
  }

  Widget _myBody() {
    return GridView(
        padding: const EdgeInsets.all(10.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 100 / 50,
          crossAxisSpacing: 0.0,
          mainAxisSpacing: 0.0,
        ),
        children: const [
          ItemOverview(
            name: 'Agenda',
            image: 'assets/calendar.png',
          ),
          ItemOverview(
            name: 'Consultas',
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
          ),
        ]);
  }

  SideBar _sideBar(BuildContext context) {
    return SideBar(
      backgroundColor: const Color.fromARGB(1, 254, 254, 254),
      iconColor: const Color.fromRGBO(80, 80, 80, 100),
      textStyle:
          const TextStyle(color: Color.fromRGBO(80, 80, 80, 100), fontSize: 12),
      selectedRoute: '/',
      items: const [
        MenuItem(
          title: 'Perfil',
          route: '',
          icon: Icons.person,
        ),
        MenuItem(
          title: 'Contato',
          route: '',
          icon: Icons.info,
        ),
        MenuItem(
          title: 'Configurações',
          route: '',
          icon: Icons.settings,
        ),
      ],
      onSelected: (item) {},
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
        onTap: () {},
      ),
    );
  }
}
