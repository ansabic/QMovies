import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:q_movies/di/di.dart';
import 'package:q_movies/service/genres_service/genres_service.dart';

import '../../service/movies_service/movies_event.dart';
import '../../service/movies_service/movies_service.dart';

part 'splash_screen_event.dart';
part 'splash_screen_state.dart';

@injectable
class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  final GenresService _genresService;

  SplashScreenBloc(this._genresService) : super(SplashScreenInitial()) {
    on<StartLoading>((event, emit) async {
      getIt<MovieService>().add(CheckActivity());
      await _genresService.syncGenres();
      add(Proceed());
    });
    on<Proceed>((event, emit) {
      emit(ProceedState());
    });
    add(StartLoading());
  }
}
