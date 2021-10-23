import 'package:flutter/material.dart';
import 'package:flutter_meedu/state.dart';
import 'package:tramipet/app/ui/global_controllers/session_controller.dart';
import 'package:flutter_meedu/router.dart' as router;
import 'package:tramipet/app/ui/routes/routes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  TextEditingController nombreSolicitudesForm = TextEditingController();
  TextEditingController apellidoSolicitudesForm = TextEditingController();
  TextEditingController dniSolicitudesForm = TextEditingController();
  TextEditingController materiaSolicitudesForm = TextEditingController();
  TextEditingController telefonoSolicitudesForm = TextEditingController();

  final firebase = FirebaseFirestore.instance;

  enviarRendirMaterias() async {
    try {
      await firebase.collection("SolicitudesMaterias").doc().set({
        "nombre": nombreSolicitudesForm.text,
        "apellido": apellidoSolicitudesForm.text,
        "dni": dniSolicitudesForm.text,
        "materia": materiaSolicitudesForm.text,
        "telefono": telefonoSolicitudesForm.text,
      });
    } catch (e) {
      print(e);
    }
  }

  cancelar() async {
    try {} catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LabelButton(
            label: 'Solicitud para rendir materias',
            value: '',
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: const Text('Rendir materias'),
                        content: Form(
                          child: Column(
                            children: [
                              TextFormField(
                                controller: nombreSolicitudesForm,
                                onChanged: (value) {},
                                decoration: const InputDecoration(
                                    hintText: "Ingrese su nombre "),
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                controller: apellidoSolicitudesForm,
                                onChanged: (value) {},
                                decoration: const InputDecoration(
                                    hintText: "Ingrese su apellido"),
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                controller: dniSolicitudesForm,
                                onChanged: (value) {},
                                decoration: const InputDecoration(
                                    hintText: "Ingrese su DNI "),
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                controller: materiaSolicitudesForm,
                                onChanged: (value) {},
                                decoration: const InputDecoration(
                                    hintText: "Materia a rendir"),
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                controller: telefonoSolicitudesForm,
                                onChanged: (value) {},
                                decoration:
                                    const InputDecoration(hintText: "Teléfono"),
                              ),
                              const SizedBox(height: 10),
                              TextButton(
                                onPressed: () {
                                  cancelar();
                                  nombreSolicitudesForm.clear();
                                  dniSolicitudesForm.clear();
                                  materiaSolicitudesForm.clear();
                                  telefonoSolicitudesForm.clear();
                                },
                                child: const Text('Cancelar'),
                              ),
                              TextButton(
                                onPressed: () {
                                  enviarRendirMaterias();
                                  nombreSolicitudesForm.clear();
                                  dniSolicitudesForm.clear();
                                  materiaSolicitudesForm.clear();
                                  telefonoSolicitudesForm.clear();
                                },
                                child: const Text('Enviar'),
                              ),
                            ],
                          ),
                        ),
                      ));
            },
          ),
          LabelButton(
            label: 'Solicitar certificados',
            value: '',
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: const Text('Solicitud de certificados'),
                        content: Form(
                          child: Column(
                            children: [
                              TextFormField(
                                onChanged: (value) {},
                                decoration: const InputDecoration(
                                    hintText: "Ingrese su nombre "),
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                onChanged: (value) {},
                                decoration: const InputDecoration(
                                    hintText: "Ingrese su DNI "),
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                onChanged: (value) {},
                                decoration: const InputDecoration(
                                    hintText: "Materia a rendir"),
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                onChanged: (value) {},
                                decoration:
                                    const InputDecoration(hintText: "Teléfono"),
                              ),
                              const SizedBox(height: 10),
                              TextButton(
                                onPressed: () {},
                                child: const Text('Cancelar'),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: const Text('Enviar'),
                              ),
                            ],
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
          style: const TextStyle(fontWeight: FontWeight.w500),
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
