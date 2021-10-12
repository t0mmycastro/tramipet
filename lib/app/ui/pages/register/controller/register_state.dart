import 'package:equatable/equatable.dart';

class RegisterState extends Equatable {
  final String email, password, vpassword, nombre, apellido;
  RegisterState({
    required this.email,
    required this.password,
    required this.vpassword,
    required this.nombre,
    required this.apellido,
  });

  static RegisterState get initialState => RegisterState(
      email: '', password: '', vpassword: '', nombre: '', apellido: '');

  RegisterState copyWith({
    String? email,
    String? password,
    String? vpassword,
    String? nombre,
    String? apellido,
  }) {
    return RegisterState(
      email: email ?? this.email,
      password: password ?? this.password,
      vpassword: vpassword ?? this.vpassword,
      nombre: nombre ?? this.nombre,
      apellido: apellido ?? this.apellido,
    );
  }

  @override
  List<Object?> get props => [email, password, nombre, apellido];
}
