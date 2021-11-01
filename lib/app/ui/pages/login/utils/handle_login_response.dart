import 'package:flutter/material.dart';
import 'package:tramipet/app/domain/responses/sign_in_response.dart';
import 'package:tramipet/app/ui/global_widgets/dialogs/dialogs.dart';
import 'package:tramipet/app/ui/routes/routes.dart';
import 'package:flutter_meedu/router.dart' as router;

void handleLoginResponse(BuildContext context, SignInResponse response) {
  if (response.error != null) {
    String errorMessage = "";

    if (response.error != SignInError.cancelled) {
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
        case SignInError.invalidCredential:
          errorMessage = "Sesión inválida";
          break;
        case SignInError.accountExistsWithDifferentCredential:
          errorMessage = response.providerId ?? "Método de logueo incorrecto";
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
    }
  } else {
    router.pushReplacementNamed(Routes.HOME);
  }
}
