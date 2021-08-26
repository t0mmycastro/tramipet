import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:tramipet/src/pages/home_page.dart';
import 'package:tramipet/src/pages/rendirfebrero_page.dart';
import 'package:tramipet/src/pages/rendirlibre_page.dart';
import 'package:tramipet/src/pages/certalumnoregular_page.dart';
import 'package:tramipet/src/pages/certalumnoretiro_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tramipet Componentes',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', ''),
        Locale('es', 'ES'),
      ],
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => HomePage(),
        'rendir_febrero': (BuildContext context) => RendirFebreroPage(),
        'rendir_libre': (BuildContext context) => RendirLibrePage(),
        'cert_alumno_regular': (BuildContext context) =>
            CertAlumnoRegularPage(),
        'cert_alumno_retiro': (BuildContext context) => CertAlumnoRetiroPage(),
      },
    );
  }
}
