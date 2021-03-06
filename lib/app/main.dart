import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'inject_dependencies.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await injectDependencies();
  runApp(
    MyApp(),
  );
}
