import 'package:flutter/widgets.dart' show Widget, BuildContext;
import 'package:tramipet/app/ui/pages/login/login_page.dart';
import 'package:tramipet/app/ui/pages/register/registro_page.dart';
import 'package:tramipet/app/ui/pages/splash/splash.dart';
import 'package:tramipet/app/ui/pages/home/home_page.dart';
import 'package:tramipet/src/pages/certalumnoregular_page.dart';
import 'package:tramipet/src/pages/certalumnoretiro_page.dart';
import 'package:tramipet/src/pages/rendirfebrero_page.dart';
import 'package:tramipet/src/pages/rendirlibre_page.dart';
import 'routes.dart';

Map<String, Widget Function(BuildContext)> get appRoutes => {
      Routes.SPLASH: (_) => const SplashPage(),
      Routes.LOGIN: (_) => LoginPage(),
      Routes.HOME: (_) => HomePage(),
      Routes.REGISTER: (_) => const RegistroPage(),
      Routes.FORM1: (_) => CertAlumnoRegularPage(),
      Routes.FORM2: (_) => CertAlumnoRetiroPage(),
      Routes.FORM3: (_) => RendirFebreroPage(),
      Routes.FORM4: (_) => RendirLibrePage(),
    };
