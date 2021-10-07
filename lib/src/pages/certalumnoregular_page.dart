import 'package:flutter/material.dart';

import 'package:tramipet/src/pages/pantalla_finalizado_certificados.dart';

class CertAlumnoRegularPage extends StatefulWidget {
  @override
  _CertAlumnoRegularPageState createState() => _CertAlumnoRegularPageState();
}

class _CertAlumnoRegularPageState extends State<CertAlumnoRegularPage> {
  String _fecha = '';
  String _opcionSeleccionada = 'Mañana';

  List<String> _cursos = ['Mañana', 'Tarde', '', ''];

  TextEditingController _inputFieldDate = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Certificado de alumno regular'),
        backgroundColor: Color(0xff43cbff),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crearNombreCertRegular(),
          Divider(),
          _crearEmailCertRegular(),
          Divider(),
          _crearDniCertRegular(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearAnioElectivoCertRegular(),
          Divider(),
          _crearTutorCertRegular(),
          Divider(),
          _crearTelefonoCertRegular(),
          Divider(),
          _crearBoton(context),
        ],
      ),
    );
  }

  Widget _crearNombreCertRegular() {
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

  Widget _crearEmailCertRegular() {
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

  Widget _crearDniCertRegular() {
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

  List<DropdownMenuItem<String>> getOpcionesCurso() {
    List<DropdownMenuItem<String>> lista = [];

    _cursos.forEach((curso) {
      lista.add(DropdownMenuItem(
        child: Text(curso),
        value: curso,
      ));
    });

    return lista;
  }

  Widget _crearFecha(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDate,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: 'Fecha y hora',
        labelText: 'Fecha y hora (3 días de anticipacion)',
        icon: Icon(Icons.calendar_today),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDate(context);
      },
    );
  }

  Widget _crearAnioElectivoCertRegular() {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: 'Año electivo',
        labelText: 'Año electivo',
        icon: Icon(Icons.business_center),
      ),
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

  Widget _crearTutorCertRegular() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintText: 'Nombres y apellido completo del tutor',
        labelText: 'Tutor responsable',
        icon: Icon(Icons.assignment_ind_outlined),
      ),
    );
  }

  Widget _crearTelefonoCertRegular() {
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
                return PantallaFinalizadoCertificados();
              }));
            },
            child: const Text('Enviar'),
          ),
        ],
      ),
    );
  }
}
