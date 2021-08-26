import 'package:flutter/material.dart';

import 'package:tramipet/src/pages/home_page.dart';

class PantallaFinalizadoCertificados extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('¡Ya está todo listo!'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 300.0),
        children: <Widget>[
          _pantallaFinalizado(),
          _crearBotonFinalizado(context),
        ],
      ),
    );
  }

  _pantallaFinalizado() {
    return Card(
      child: Column(children: <Widget>[
        ListTile(
          leading: Icon(Icons.photo_album, color: Colors.blue),
          title: Text('En proceso de revisión'),
          subtitle: Text(
              'Su petición sobre el certificado pedido, ha sido enviado a la secretaría del establecimiento, se le avisará por email cuando ya este todo listo.'),
        ),
      ]),
    );
  }

  Widget _crearBotonFinalizado(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const SizedBox(height: 30),
          ElevatedButton(
            style: style,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return HomePage();
              }));
            },
            child: const Text('Volver al inicio'),
          ),
        ],
      ),
    );
  }
}
