import 'package:flutter/material.dart';
import 'package:flutter_app_clinica_web/components/component/custom_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: const Center(
            child: Text('tela home'),
          ),
        ),
        endDrawer: const CustomDrawer());
  }
}
