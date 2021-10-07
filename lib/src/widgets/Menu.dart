import 'package:flutter/material.dart';

class MenuPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30.0),
      child: GridView.count(crossAxisCount: 2, children: <Widget>[
        MiMenu(
            titulo: "Libres",
            icono: Icons.account_balance,
            colorito: Colors.brown),
      ]),
    );
  }
}

class MiMenu extends StatelessWidget {
  MiMenu({
    required this.titulo,
    required this.icono,
    required this.colorito,
  });

  final String titulo;
  final IconData icono;
  final MaterialColor colorito;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {},
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(
                icono,
                size: 70.0,
                color: colorito,
              ),
              Text(titulo, style: new TextStyle(fontSize: 17.0)),
            ],
          ),
        ),
      ),
    );
  }
}
