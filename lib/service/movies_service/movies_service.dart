import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:q_movies/repository/local/max_pages/max_pages_repository_impl.dart';
import 'package:q_movies/repository/remote/remote_movie/remote_movie_repository.dart';
import 'package:q_movies/service/movies_service/movies_event.dart';
import 'package:q_movies/service/movies_service/movies_state.dart';

import '../../common/result.dart';
import '../../model/loaded_pages/max_pages.dart';
import '../../repository/local/local_movie/local_movie_repository.dart';

@singleton
class MovieService extends Bloc<MoviesEvent, MoviesState> {
  final RemoteMovieRepository _remoteMovieRepository;
  final LocalMovieRepository _localMovieRepository;
  final LocalMaxPagesRepository _maxPagesRepository;

  MovieService(this._remoteMovieRepository, this._localMovieRepository, this._maxPagesRepository)
      : super(MoviesInitState()) {
    on<InitMovies>((event, emit) {
      emit(MoviesRefreshedState(
          movies: _localMovieRepository.getAll().entries.map((e) => e.value).flattened.toList(), active: state.active));
    });
    on<CheckActivity>((event, emit) {
      if (!state.active) {
        emit(MoviesRefreshedState(active: true, movies: state.movies));
        add(SyncMoviesMaxPage());
      }
    });
    on<SyncMoviesMaxPage>((event, emit) async {
      final maxPages = _maxPagesRepository.getSingle() ?? 0;

      final moviesRemoteResult = await _remoteMovieRepository.getMoviesPage(page: _localMovieRepository.getAll().length + 1);
      if (moviesRemoteResult is Value) {
        final moviesRemote = moviesRemoteResult.value!;
        await _localMovieRepository.putAt(key: moviesRemote.page, element: moviesRemote.movies);
        if (moviesRemote.total != maxPages) {
          await _maxPagesRepository.removeData();
          await _maxPagesRepository.setSingle(data: MaxPages(max: moviesRemote.total));
        }
      }
      emit(MoviesRefreshedState(
        movies: _localMovieRepository
            .getAll()
            .entries
            .map((e) => e.value)
            .flattened
            .toList(),
        active: false,
      ));
    });
    add(InitMovies());
  }
}
