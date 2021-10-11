import 'package:flutter/widgets.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:tramipet/app/domain/responses/sign_up_response.dart';
import 'package:tramipet/app/ui/pages/register/controller/register_state.dart';
import 'package:tramipet/repositorio/registrando_repositorio.dart';

class RegisterController extends StateNotifier<RegisterState> {
  RegisterController() : super(RegisterState.initialState);
  final GlobalKey<FormState> formKey = GlobalKey();
  final _signUpRepository = Get.i.find<SignUpRepository>();

  Future<SignUpResponse> submit() {
    return _signUpRepository.registrando(
      SignUpData(
        nombre: state.nombre,
        apellido: state.apellido,
        email: state.email,
        password: state.password,
      ),
    );
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
