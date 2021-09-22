part of 'tramipetlogin_bloc.dart';

abstract class TramipetloginEvent extends Equatable {
  const TramipetloginEvent();

  @override
  List<Object> get props => [];
}

class Logueando extends TramipetloginEvent {
  final String email;
  final String pass;

  Logueando(this.email, this.pass);
  @override
  List<Object> get props => [email, pass];
}
