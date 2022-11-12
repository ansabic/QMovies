import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';

part 'shine_event.dart';
part 'shine_state.dart';

class ShineBloc extends Bloc<ShineEvent, ShineState> {
  static const num _fps = 120;
  static const num interval = 1000 / _fps;
  static const num period = 400;
  final double shineFactor;
  final double shineAmplitude;
  Timer? timer;

  ShineBloc({this.shineFactor = 0.8, this.shineAmplitude = 0.2}) : super(const ShineInitial()) {
    on<StartShine>((event, emit) {
      timer?.cancel();
      timer = Timer.periodic(Duration(milliseconds: interval.toInt()), (timer) {
        final x = sin(timer.tick * interval / period);
        add(RefreshShine(value: shineFactor + shineAmplitude * x));
      });
    });
    on<StopShine>((event, emit) {
      timer?.cancel();
    });
    on<RefreshShine>((event, emit) {
      emit(RefreshShineState(value: event.value));
    });
    add(StartShine());
  }

  @override
  Future<void> close() {
    add(StopShine());
    return super.close();
  }
}
