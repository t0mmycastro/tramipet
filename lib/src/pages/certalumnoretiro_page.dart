import 'package:flutter/material.dart';

import 'package:tramipet/src/pages/pantalla_finalizado_certificados.dart';

class CertAlumnoRetiroPage extends StatefulWidget {
  @override
  _CertAlumnoRetiroPageState createState() => _CertAlumnoRetiroPageState();
}

class _CertAlumnoRetiroPageState extends State<CertAlumnoRetiroPage> {
  String _fecha = '';
  bool _bloquearCheck = false;
  String _opcionSeleccionada = 'Mañana';

  List<String> _cursos = ['Mañana', 'Tarde', '', ''];

  TextEditingController _inputFieldDate = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Certificado de alumno retiro'),
        backgroundColor: Color(0xff43cbff),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: <Widget>[
          _crearNombreCertRetiro(),
          Divider(),
          _crearEmailCertRetiro(),
          Divider(),
          _crearDniCertRetiro(),
          Divider(),
          _crearCursoCertRetiro(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearAnioElectivoCertRetiro(),
          Divider(),
          _crearTutorCertRetiro(),
          Divider(),
          _crearTelefonoCertRetiro(),
          Divider(),
          _checkBox(),
          Divider(),
          _crearBoton(context),
        ],
      ),
    );
  }

  Widget _crearNombreCertRetiro() {
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

  Widget _crearEmailCertRetiro() {
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

  Widget _crearDniCertRetiro() {
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

  Widget _crearCursoCertRetiro() {
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 30.0),
        Expanded(
          child: DropdownButton(
              value: _opcionSeleccionada,
              items: getOpcionesCurso(),
              onChanged: (opt) {
                setState(() {
                  _opcionSeleccionada = opt;
                });
              }),
        )
      ],
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

  Widget _crearAnioElectivoCertRetiro() {
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
    DateTime picked = await showDatePicker(
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

  Widget _crearTutorCertRetiro() {
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

  Widget _crearTelefonoCertRetiro() {
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

  Widget _checkBox() {
    return CheckboxListTile(
        title: Text(
            'Acepta que la presente autorización deslinda de toda responsabilidad a la institución, una vez consentida la misma.'),
        value: _bloquearCheck,
        onChanged: (valor) {
          setState(() {
            _bloquearCheck = valor;
          });
        });
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
