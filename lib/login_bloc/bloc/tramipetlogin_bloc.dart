import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tramipetlogin_event.dart';
part 'tramipetlogin_state.dart';

class TramipetloginBloc extends Bloc<TramipetloginEvent, TramipetloginState> {
  TramipetloginBloc() : super(TramipetloginInitial()) {
    on<TramipetloginEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
