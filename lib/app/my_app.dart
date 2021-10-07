import 'package:flutter/material.dart';
import 'package:tramipet/app/ui/routes/app_routes.dart';
import 'package:tramipet/app/ui/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/router.dart' as router;
import 'package:flutter_meedu/state.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: router.appKey,
      title: 'Tramipet Componentes',
      navigatorKey: router.navigatorKey,
      debugShowCheckedModeBanner: false,
      navigatorObservers: [
        router.observer,
      ],
      initialRoute: Routes.LOGIN,
      routes: appRoutes,
    );
  }
}
