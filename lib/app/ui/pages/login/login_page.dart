import 'package:flutter/material.dart';
import 'package:flutter_meedu/router.dart' as router;
import 'package:tramipet/app/ui/routes/routes.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(children: [
            ElevatedButton(
              onPressed: () => router.pushNamed(Routes.REGISTER),
              child: const Text("Sign Up"),
            ),
          ]),
        ),
      ),
    );
  }
}
