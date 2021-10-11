import 'package:flutter/material.dart';
import 'package:tramipet/app/domain/responses/sign_in_response.dart';
import 'package:tramipet/app/ui/global_widgets/dialogs/dialogs.dart';
import 'package:tramipet/app/ui/global_widgets/dialogs/progress_dialog.dart';
import 'package:tramipet/app/ui/routes/routes.dart';
import '../login_page.dart' show loginProvider;
import 'package:flutter_meedu/router.dart' as router;

Future<void> sendLoginForm(BuildContext context) async {
  final controller = loginProvider.read;
  final isValidForm = controller.formKey.currentState!.validate();
  if (isValidForm) {
    ProgressDialog.show(context);
    final response = await controller.submit();
    router.pop();
    if (response.error != null) {
      String errorMessage = "";

      switch (response.error) {
        case SignInError.networkRequestFailed:
          errorMessage = "Fallo en el envio a la network";
          break;
        case SignInError.userDisabled:
          errorMessage = "Este usuario está desabilitado";
          break;
        case SignInError.userNotFound:
          errorMessage = "Este usuario no existe";
          break;
        case SignInError.wrongPassword:
          errorMessage = "La contraseña es incorrecta";
          break;
        case SignInError.unknown:
        default:
          errorMessage = "Error desconocido";
          break;
      }

      Dialogs.alert(
        context,
        title: "Error",
        content: errorMessage,
      );
    } else {
      router.pushReplacementNamed(Routes.HOME);
    }
  }
}
