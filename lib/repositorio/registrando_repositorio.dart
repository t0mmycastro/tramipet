import 'package:tramipet/app/domain/responses/sign_up_response.dart';

abstract class SignUpRepository {
  Future<SignUpResponse> registrando(SignUpData data);
}

class SignUpData {
  final String nombre, apellido, email, password;

  SignUpData({
    required this.nombre,
    required this.apellido,
    required this.email,
    required this.password,
  });
}
