import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:q_movies/service/genres_service/genres_service.dart';

import '../../service/movies_service/movies_service.dart';

part 'splash_screen_event.dart';
part 'splash_screen_state.dart';

@injectable
class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  final MoviesService _moviesService;
  final GenresService _genresService;
  final initialSize = 3;

  SplashScreenBloc(this._moviesService, this._genresService) : super(SplashScreenInitial()) {
    on<StartLoading>((event, emit) async {
      await _moviesService.syncMoviesMaxPage(page: initialSize);
      await _genresService.syncGenres();
      add(Proceed());
    });
    on<Proceed>((event, emit) {
      emit(ProceedState());
    });
    add(StartLoading());
  }
}
