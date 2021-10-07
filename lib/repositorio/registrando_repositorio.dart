import 'package:firebase_auth/firebase_auth.dart';

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

class SignUpResponse {
  final SignUpError? error;
  final User? user;

  SignUpResponse(this.error, this.user);
}

parseStringToSignUpError(String text) {
  switch (text) {
    case "email-already-in-use":
      return SignUpError.emailAlreadyInUse;

    case "weak-password":
      return SignUpError.weakPassword;
    default:
      return SignUpError.unknown;
  }
}

enum SignUpError { emailAlreadyInUse, weakPassword, unknown }
