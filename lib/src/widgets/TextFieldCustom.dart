import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  final IconData icono;
  final TextInputType type;
  final bool pass;
  final String texto;

  const TextFieldCustom(
      {required this.icono,
      required this.type,
      this.pass = false,
      required this.texto});

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: type,
      obscureText: pass,
      decoration: InputDecoration(
        hintText: texto,
        filled: true,
        fillColor: Color(0xfffffff),
        prefixIcon: Icon(icono, color: Colors.cyan),
        border: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffEBDCFA)),
            borderRadius: BorderRadius.circular(50)),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffEBDCFA)),
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }
}
