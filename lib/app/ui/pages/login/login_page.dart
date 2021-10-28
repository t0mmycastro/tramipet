import 'package:flutter/material.dart';
import 'package:flutter_meedu/router.dart' as router;
import 'package:flutter_meedu/state.dart';
import 'package:tramipet/app/ui/global_controllers/session_controller.dart';
import 'package:tramipet/app/ui/global_widgets/custom_input_field.dart';
import 'package:tramipet/app/ui/pages/login/utils/send_login_form.dart';
import 'package:tramipet/app/ui/pages/login/utils/social_buttons.dart';
import 'package:tramipet/app/ui/routes/routes.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:tramipet/app/utils/email_validator.dart';
import 'package:google_fonts/google_fonts.dart';
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
                      const SizedBox(height: 200),
                      SvgPicture.asset(
                        'assets/images/bienvenido_login.svg',
                        width: 300,
                      ),
                      CustomInputField(
                        label: "Email",
                        onChanged: controller.onEmailChanged,
                        inputType: TextInputType.emailAddress,
                        validator: (text) {
                          if (isValidEmail(text!)) {
                            return null;
                          }
                          return "Email inválido";
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomInputField(
                        label: "Contraseña",
                        onChanged: controller.onPasswordChanged,
                        isPassword: true,
                        validator: (text) {
                          if (text!.trim().length >= 6) {
                            return null;
                          }
                          return "Contraseña inválida";
                        },
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        style: ButtonStyle(
                            textStyle: MaterialStateProperty.all(
                              const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            elevation: MaterialStateProperty.all(7),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            )),
                        onPressed: () => sendLoginForm(context),
                        child: const Text("Iniciar sesión"),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("¿No tienes una cuenta de alumno?"),
                          TextButton(
                            onPressed: () => router.pushNamed(Routes.REGISTER),
                            child: const Text("Registrate",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                      const Text("O inicia sesión con"),
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
