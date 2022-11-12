import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';

import '../../service/movies_service/movies_service.dart';

part 'splash_screen_event.dart';

part 'splash_screen_state.dart';

@injectable
class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  final MoviesService _moviesService;
  final initialSize = 3;

  SplashScreenBloc(this._moviesService) : super(SplashScreenInitial()) {
    on<StartLoading>((event, emit) async {
      await _moviesService.syncMoviesMaxPage(page: initialSize);
      add(Proceed());
    });
    on<Proceed>((event, emit) {
      emit(ProceedState());
    });
    add(StartLoading());
  }
}
