import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:flutter_app_clinica_web/components/component/item_overview.dart';

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
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
        ),
        children: const [
          // ItemOverview(name: 'Agenda'),
          // ItemOverview(name: 'Consultas'),
          // ItemOverview(name: 'Pacientes'),
          // ItemOverview(name: 'Adicionar Paciente'),
          // ItemOverview(name: 'teste 5'),
          // ItemOverview(name: 'teste 6'),
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
      onSelected: (item) {
        // if (item.route != null) {
        //   Navigator.of(context).pushNamed(item.route!);
        // }
        print(item.title);
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
        onTap: () {},
      ),
    );
  }
}
