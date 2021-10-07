import 'package:flutter/material.dart';
import 'package:tramipet/app/ui/global_widgets/dialogs/dialogs.dart';
import 'package:tramipet/app/ui/global_widgets/dialogs/progress_dialog.dart';
import 'package:tramipet/app/ui/routes/routes.dart';
import 'package:tramipet/repositorio/registrando_repositorio.dart';
import '../registro_page.dart' show registerProvider;
import 'package:flutter_meedu/router.dart' as router;

Future<void> sendRegisterForm(BuildContext context) async {
  final controller = registerProvider.read;
  final isValidForm = controller.formKey.currentState!.validate();

  if (isValidForm) {
    ProgressDialog.show(context);
    final response = await controller.submit();
    router.pop();
    if (response.error != null) {
      late String content;
      switch (response.error) {
        case SignUpError.emailAlreadyInUse:
          content = "El email que ingresó ya esta en uso";
          break;
        case SignUpError.weakPassword:
          content = "La contraseña es débil";
          break;
        case SignUpError.unknown:
        default:
          content = "Error desconocido";
          break;
      }

      Dialogs.alert(
        context,
        title: "Error",
        content: content,
      );
    } else {
      router.pushNamedAndRemoveUntil(Routes.HOME);
    }
  } else {
    Dialogs.alert(
      context,
      title: "Error",
      content: "Existen campos inválidos",
    );
  }
}
