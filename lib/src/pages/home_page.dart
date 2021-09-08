import 'package:flutter/material.dart';

import 'package:tramipet/src/providers/menu_provider.dart';
import 'package:tramipet/src/utils/icono_string_util.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TramiPET v1.2.1'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.cyan[200],
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Image.asset('assets/tramipet.png'),
                  ),
                  Text(
                    'Tramipet - Menu del alumno',
                    style: TextStyle(
                      fontFamily: 'Sansation_Light',
                      fontSize: 16.0,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Perfil del alumno'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Solicitudes pedidas'),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    // menuProvider.cargarData().then((opciones)

    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: _listaItems(snapshot.data, context),
        );
      },
    );
  }

  List<Widget> _listaItems(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];

    data.forEach((opt) {
      final widgetTemp = ListTile(
          title: Text(opt['texto']),
          leading: getIcon(opt['icon']),
          onTap: () {
            Navigator.pushNamed(context, opt['ruta']);

            // final route = MaterialPageRoute(builder: (context) => AlertPage());
            // Navigator.push(context, route);
          });

      opciones..add(widgetTemp)..add(Divider());
    });

    return opciones;
  }
}
