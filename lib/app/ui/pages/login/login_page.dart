import 'package:flutter/material.dart';
import 'package:flutter_meedu/router.dart' as router;
import 'package:flutter_meedu/state.dart';
import 'package:tramipet/app/ui/global_widgets/custom_input_field.dart';
import 'package:tramipet/app/ui/pages/login/utils/send_login_form.dart';
import 'package:tramipet/app/ui/routes/routes.dart';

import 'package:flutter_meedu/meedu.dart';
import 'package:tramipet/app/utils/email_validator.dart';

import 'controller/login_controller.dart';

final loginProvider = SimpleProvider(
  (_) => LoginController(),
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
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
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
                          onPressed: () => sendLoginForm(context),
                          child: const Text("Sign In"),
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () => router.pushNamed(Routes.REGISTER),
                          child: const Text("Sign Up"),
                        ),
                      ]),
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
