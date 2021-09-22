import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tramipetlogin_event.dart';
part 'tramipetlogin_state.dart';

class TramipetloginBloc extends Bloc<TramipetloginEvent, TramipetloginState> {
  TramipetloginBloc() : super(TramipetloginInitial()) {
    on<TramipetloginEvent>((event, emit) async* {
      if (event is Logueando) {
        yield Logueado();

        // Acá empieza el login
        await Future.delayed(Duration(seconds: 3));

        yield LogueandoError('No se pudo loguear');
      }
    });
  }
}
