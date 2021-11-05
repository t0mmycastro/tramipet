import 'package:flutter/widgets.dart' show Widget, BuildContext;
import 'package:tramipet/app/ui/pages/login/login_page.dart';
import 'package:tramipet/app/ui/pages/splash/splash.dart';
import 'package:tramipet/app/ui/pages/home/home_page.dart';
import 'routes.dart';

Map<String, Widget Function(BuildContext)> get appRoutes => {
      Routes.SPLASH: (_) => const SplashPage(),
      Routes.LOGIN: (_) => const LoginPage(),
      Routes.HOME: (_) => HomePage(),
    };
