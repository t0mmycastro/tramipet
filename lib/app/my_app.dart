import 'package:flutter/material.dart';
import 'package:tramipet/app/ui/global_controllers/theme_controller.dart';
import 'package:tramipet/app/ui/routes/app_routes.dart';
import 'package:tramipet/app/ui/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/router.dart' as router;
import 'package:flutter_meedu/state.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (_, ref, __) {
      final theme = ref.watch(themeProvider);
      return MaterialApp(
        key: router.appKey,
        title: 'Tramipet Componentes',
        navigatorKey: router.navigatorKey,
        debugShowCheckedModeBanner: false,
        navigatorObservers: [
          router.observer,
        ],
        initialRoute: Routes.LOGIN,
        darkTheme: theme.darkTheme,
        theme: theme.lightTheme,
        themeMode: theme.mode,
        routes: appRoutes,
      );
    });
  }
}
