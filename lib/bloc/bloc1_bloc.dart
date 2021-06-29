import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bloc1_event.dart';
part 'bloc1_state.dart';

class Bloc1Bloc extends Bloc<Bloc1Event, Bloc1State> {
  Bloc1Bloc() : super(Bloc1Initial());

  @override
  Stream<Bloc1State> mapEventToState(
    Bloc1Event event,
  ) async* {
    switch (event.runtimeType) {
      case Bloc1Load:
        yield Bloc1Loaded();
        break;
    }
  }
}
