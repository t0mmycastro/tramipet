import 'package:flutter/material.dart';
import 'package:flutter_meedu/state.dart';
import 'package:tramipet/app/ui/global_controllers/session_controller.dart';
import 'package:tramipet/app/ui/pages/login/utils/social_buttons.dart';
import 'package:flutter_meedu/meedu.dart';
import 'controller/login_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';

final loginProvider = SimpleProvider(
  (_) => LoginController(sessionProvider.read),
);

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderListener<LoginController>(
      provider: loginProvider,
      builder: (_, controller) {
        return Scaffold(
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Container(
                color: Colors.transparent,
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                child: Form(
                  key: controller.formKey,
                  child: SingleChildScrollView(
                    child: Column(children: [
                      const SizedBox(height: 110),
                      SvgPicture.asset(
                        'assets/images/bienvenido_login.svg',
                        width: 500,
                      ),
                      const Text("Agiliza tus trámites escolares"),
                      const SizedBox(height: 45),
                      const Text("Inicia sesión con",
                          style: TextStyle(fontSize: 35.0)),
                      const SizedBox(height: 10),
                      const SocialButtons(),
                    ]),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );

    ;
  }
}
