import 'package:flutter/material.dart';
import 'package:flutter_meedu/router.dart' as router;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tramipet/app/ui/routes/routes.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  TextEditingController nombreSolicitudesForm = TextEditingController();
  TextEditingController apellidoSolicitudesForm = TextEditingController();
  TextEditingController cursoSolicitudesForm = TextEditingController();
  TextEditingController dniSolicitudesForm = TextEditingController();
  TextEditingController materiaSolicitudesForm = TextEditingController();

  final firebase = FirebaseFirestore.instance;

  enviarRendirMaterias() async {
    try {
      await firebase.collection("SolicitudesMaterias").doc().set({
        "nombre": nombreSolicitudesForm.text,
        "apellido": apellidoSolicitudesForm.text,
        "curso": cursoSolicitudesForm.text,
        "dni": dniSolicitudesForm.text,
        "materia": materiaSolicitudesForm.text,
      });
    } catch (e) {
      print(e);
    }
  }

  salir() async {
    try {} catch (e) {}
  }

  final _formCertKey = GlobalKey<FormState>();
  List<String> accountType = <String>[
    'Savings',
    'Deposit',
    'Checking',
    'Brokerage'
  ];
  var selectedCurrency, selectedType;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          const SizedBox(height: 20),
          const Text(
            "¡Bienvenido a TramiPET!",
            style: TextStyle(fontSize: 20),
          ),
          Image.asset('assets/tramipet.png', height: 330, width: 330),
          const Text(
              'Cualquier duda comunicarse con los directivos del colegio',
              style: TextStyle(fontSize: 13)),
          const SizedBox(height: 70),
          LabelButton(
            label: 'Solicitud para rendir materias',
            value: '',
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: const Text('Rendir materias'),
                        content: Form(
                          key: _formCertKey,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: nombreSolicitudesForm,
                                  onChanged: (value) {},
                                  decoration: const InputDecoration(
                                    hintText: "Ingrese su nombre ",
                                    icon: Icon(
                                      Icons.accessibility,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                TextFormField(
                                  controller: apellidoSolicitudesForm,
                                  onChanged: (value) {},
                                  decoration: const InputDecoration(
                                    hintText: "Ingrese su apellido",
                                    icon: Icon(
                                      Icons.accessibility,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                TextFormField(
                                  controller: cursoSolicitudesForm,
                                  onChanged: (value) {},
                                  decoration: const InputDecoration(
                                    hintText: "Ingrese su curso",
                                    icon: Icon(
                                      Icons.border_color,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  controller: dniSolicitudesForm,
                                  onChanged: (value) {},
                                  decoration: const InputDecoration(
                                    hintText: "DNI",
                                    icon: Icon(
                                      Icons.password,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                TextFormField(
                                  controller: materiaSolicitudesForm,
                                  onChanged: (value) {},
                                  decoration: const InputDecoration(
                                    hintText: "Materia a rendir",
                                    icon: Icon(
                                      Icons.book,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                TextButton(
                                  onPressed: () {
                                    salir();
                                    nombreSolicitudesForm.clear();
                                    apellidoSolicitudesForm.clear();
                                    cursoSolicitudesForm.clear();
                                    dniSolicitudesForm.clear();
                                    materiaSolicitudesForm.clear();
                                    router.pushReplacementNamed(Routes.HOME);
                                  },
                                  child: const Text('Salir'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    enviarRendirMaterias();
                                    nombreSolicitudesForm.clear();
                                    apellidoSolicitudesForm.clear();
                                    cursoSolicitudesForm.clear();
                                    dniSolicitudesForm.clear();
                                    materiaSolicitudesForm.clear();
                                    router.pushReplacementNamed(Routes.HOME);
                                  },
                                  child: const Text('Enviar'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ));
            },
          ),
        ],
      ),
    );
  }
}

class LabelButton extends StatelessWidget {
  final String label, value;
  final VoidCallback? onPressed;
  const LabelButton(
      {Key? key, required this.label, required this.value, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) => ListTile(
        onTap: onPressed,
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        leading: Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(value, style: const TextStyle(fontWeight: FontWeight.w300)),
            const SizedBox(width: 5),
            const Icon(
              Icons.chevron_right_rounded,
              size: 22,
            )
          ],
        ),
      );
}
