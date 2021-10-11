import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/state.dart';
import 'package:tramipet/app/ui/global_widgets/custom_input_field.dart';
import 'package:tramipet/app/ui/pages/register/utils/send_register_form.dart';
import 'package:tramipet/app/utils/email_validator.dart';
import 'package:tramipet/app/utils/name_validator.dart';

import 'package:flutter_meedu/meedu.dart';

import 'controller/register_controller.dart';
import 'controller/register_state.dart';

final registerProvider = StateProvider<RegisterController, RegisterState>(
  (_) => RegisterController(),
);

class RegistroPage extends StatelessWidget {
  const RegistroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderListener<RegisterController>(
      provider: registerProvider,
      builder: (_, controller) {
        return Scaffold(
          appBar: AppBar(),
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.transparent,
              child: Form(
                key: controller.formKey,
                child: ListView(
                  padding: const EdgeInsets.all(15),
                  children: [
                    CustomInputField(
                      label: "Nombre",
                      onChanged: controller.onNameChanged,
                      validator: (text) {
                        return isValidName(text!) ? null : "Nombre inválido";
                      },
                    ),
                    const SizedBox(height: 15.0),
                    CustomInputField(
                      label: "Apellido",
                      onChanged: controller.onLastNameChanged,
                      validator: (text) {
                        return isValidName(text!) ? null : "Apellido inválido";
                      },
                    ),
                    const SizedBox(height: 15.0),
                    CustomInputField(
                      label: "E-mail",
                      inputType: TextInputType.emailAddress,
                      onChanged: controller.onEmailChanged,
                      validator: (text) {
                        return isValidEmail(text!) ? null : "Email inválido";
                      },
                    ),
                    const SizedBox(height: 15.0),
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
                    const SizedBox(height: 15.0),
                    Consumer(
                      builder: (_, watch, __) {
                        //  watch(registerProvider.select((p0) => null));
                        return CustomInputField(
                          label: "Confirmar contraseña",
                          onChanged: controller.onVPasswordChanged,
                          isPassword: true,
                          validator: (text) {
                            if (controller.state.password != text) {
                              return "Las contraseñas no coinciden";
                            }
                            if (text!.trim().length >= 6) {
                              return null;
                            }

                            return "Contraseña inválida";
                          },
                        );
                      },
                    ),
                    const SizedBox(height: 30),
                    CupertinoButton(
                      child: const Text("Registrarse"),
                      color: Colors.blue,
                      onPressed: () => sendRegisterForm(context),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
