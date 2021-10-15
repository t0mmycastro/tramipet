import 'package:tramipet/src/pages/pantalla_finalizado.dart';
import 'package:flutter/material.dart';

class RendirFebreroPage extends StatefulWidget {
  @override
  _RendirFebreroPageState createState() => _RendirFebreroPageState();
}

class _RendirFebreroPageState extends State<RendirFebreroPage> {
  String _fecha = '';

  TextEditingController _inputFieldDate = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rendir materias Febrero'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crearNombreFebrero(),
          Divider(),
          _crearEmailFebrero(),
          Divider(),
          _crearDniFebrero(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearMateriaFebrero(),
          Divider(),
          _crearCursadaFebrero(),
          Divider(),
          _crearTelefonoFebrero(),
          Divider(),
          _crearBoton(context),
        ],
      ),
    );
  }

  Widget _crearNombreFebrero() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: 'Nombre y Apellido del alumno',
        labelText: 'Nombre y apellido',
        icon: Icon(Icons.account_circle),
      ),
    );
  }

  Widget _crearEmailFebrero() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: 'Email',
        labelText: 'Email',
        icon: Icon(Icons.email),
      ),
    );
  }

  Widget _crearDniFebrero() {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: 'DNI del Alumno',
        labelText: 'DNI',
        icon: Icon(Icons.badge),
      ),
    );
  }

  Widget _crearFecha(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDate,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: 'Fecha en la que desea rendir',
        labelText: 'Fechas para rendir',
        icon: Icon(Icons.calendar_today),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2021),
      lastDate: new DateTime(2025),
      locale: Locale('es', 'ES'),
    );

    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        _inputFieldDate.text = _fecha;
      });
    }
  }

  Widget _crearMateriaFebrero() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: 'Ingrese la materia',
        labelText: 'Materia a rendir',
        icon: Icon(Icons.chrome_reader_mode),
      ),
    );
  }

  Widget _crearCursadaFebrero() {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: 'Año cursando',
        labelText: 'Año cursando',
        icon: Icon(Icons.chrome_reader_mode),
      ),
    );
  }

  Widget _crearTelefonoFebrero() {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: 'Teléfono de contacto',
        labelText: 'Teléfono de contacto',
        icon: Icon(Icons.add_ic_call),
      ),
    );
  }

  Widget _crearBoton(BuildContext context) {
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
                return PantallaFinalizado();
              }));
            },
            child: const Text('Enviar'),
          ),
        ],
      ),
    );
  }
}
