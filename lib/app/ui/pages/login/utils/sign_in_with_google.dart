import 'package:flutter/material.dart';
import 'package:tramipet/app/ui/global_widgets/dialogs/progress_dialog.dart';
import 'package:tramipet/app/ui/pages/login/login_page.dart';
import 'package:tramipet/app/ui/pages/login/utils/handle_login_response.dart';

void signInWithGoogle(BuildContext context) async {
  ProgressDialog.show(context);
  final controller = loginProvider.read;
  final response = await controller.signInWithGoogle();
  Navigator.pop(context);
  handleLoginResponse(context, response);
}
