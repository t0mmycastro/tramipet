import 'package:flutter/widgets.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:tramipet/app/domain/responses/sign_up_response.dart';
import 'package:tramipet/app/ui/global_controllers/session_controller.dart';
import 'package:tramipet/app/ui/pages/register/controller/register_state.dart';
import 'package:tramipet/repositorio/registrando_repositorio.dart';

class RegisterController extends StateNotifier<RegisterState> {
  final SessionController _sessionController;
  RegisterController(this._sessionController)
      : super(RegisterState.initialState);
  final GlobalKey<FormState> formKey = GlobalKey();
  final SignUpRepository _signUpRepository = Get.i.find();

  Future<SignUpResponse> submit() async {
    final response = await _signUpRepository.registrando(
      SignUpData(
        nombre: state.nombre,
        apellido: state.apellido,
        email: state.email,
        password: state.password,
      ),
    );

    if (response.error == null) {
      _sessionController.setUser(response.user!);
    }

    return response;
  }

  void onNameChanged(String text) {
    state = state.copyWith(nombre: text);
  }

  void onLastNameChanged(String text) {
    state = state.copyWith(apellido: text);
  }

  void onEmailChanged(String text) {
    state = state.copyWith(email: text);
  }

  void onPasswordChanged(String text) {
    state = state.copyWith(password: text);
  }

  void onVPasswordChanged(String text) {
    state = state.copyWith(vpassword: text);
  }
}
