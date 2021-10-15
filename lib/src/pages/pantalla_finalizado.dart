import 'package:flutter/material.dart';

import 'package:tramipet/app/ui/pages/home/home_page.dart';

class PantallaFinalizado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('¡Ya está todo listo!'),
        automaticallyImplyLeading: false,
        centerTitle: true,
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
          title: Text('En proceso de inscripción'),
          subtitle: Text(
              'Su inscripción a las mesas ha sido enviada y será avisado por email si su inscripción fue aceptada o rechazada.'),
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
