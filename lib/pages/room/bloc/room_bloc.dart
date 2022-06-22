import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'room_event.dart';
part 'room_state.dart';

class RoomBloc extends Bloc<RoomEvent, RoomState> {
  RoomBloc() : super(RoomInitial()) {
    on<RoomEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
