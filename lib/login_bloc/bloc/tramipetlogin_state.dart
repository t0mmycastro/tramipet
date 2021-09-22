part of 'tramipetlogin_bloc.dart';

abstract class TramipetloginState extends Equatable {
  const TramipetloginState();

  @override
  List<Object> get props => [];
}

class TramipetloginInitial extends TramipetloginState {}

class Logueado extends TramipetloginState {
  @override
  List<Object> get props => [];
}

class LogueandoAceptado extends TramipetloginState {
  final String token;

  LogueandoAceptado(this.token);

  @override
  List<Object> get props => [token];
}

class LogueandoError extends TramipetloginState {
  final String mensaje;

  LogueandoError(this.mensaje);
}
