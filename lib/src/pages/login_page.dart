import 'package:flutter/material.dart';

import 'package:tramipet/src/pages/home_page.dart';
import 'package:tramipet/src/widgets/Header.dart';
import 'package:tramipet/src/widgets/Logo.dart';
import 'package:tramipet/src/widgets/TextFieldCustom.dart';

class LoginPage extends StatefulWidget {
  static String id = 'login_page';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            //  mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HeaderLogin(),
              LogoHeader(),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'Tramipet - Aplicación de trámites escolares',
              ), // Esto después lo edito mejor
              SizedBox(
                height: 20.0,
              ),
              SizedBox(
                height: 30.0,
              ),
              _userTextField(),
              SizedBox(
                height: 20.0,
              ),
              _buttonLogin(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _userTextField() {
    return StreamBuilder(
        builder: (BuildContext context, AsyncSnapshot snapshot) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 35.0),
        child: Column(
          children: [
            TextFieldCustom(
                icono: Icons.mail_outline,
                type: TextInputType.emailAddress,
                texto: 'Email Address'),
            SizedBox(height: 20),
            TextFieldCustom(
                icono: Icons.visibility_off,
                type: TextInputType.text,
                pass: true,
                texto: 'Password'),
          ],
        ),
      );
    });
  }

  Widget _buttonLogin(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 15));

    return Container(
      margin: EdgeInsets.all(50),
      decoration: BoxDecoration(
          color: Color(0xff89dbf5), borderRadius: BorderRadius.circular(50)),
      child: TextButton(
        child: Text('Iniciar sesión',
            style: TextStyle(color: Colors.white, fontSize: 18)),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return HomePage();
          }));
        },
      ),
    );
  }
}
