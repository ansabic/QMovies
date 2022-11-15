import 'dart:async';

import 'package:collection/collection.dart';
import 'package:injectable/injectable.dart';
import 'package:q_movies/model/movie/movie.dart';
import 'package:q_movies/repository/local/max_pages/max_pages_repository_impl.dart';
import 'package:q_movies/repository/remote/remote_movie/remote_movie_repository.dart';
import 'package:q_movies/service/movies_service/movies_service.dart';

import '../../common/result.dart';
import '../../model/loaded_pages/max_pages.dart';
import '../../repository/local/local_movie/local_movie_repository.dart';

@Injectable(as: MoviesService)
class MovieServiceImpl implements MoviesService {
  final RemoteMovieRepository _remoteMovieRepository;
  final LocalMovieRepository _localMovieRepository;
  final LocalMaxPagesRepository _maxPagesRepository;

  bool _isActive = false;
  StreamController<List<Movie>> movieStreamController = StreamController();

  MovieServiceImpl(this._remoteMovieRepository, this._localMovieRepository, this._maxPagesRepository);

  @override
  Future<bool> syncMoviesMaxPage({required int page}) async {
    if (!_isActive) {
      _isActive = true;
      final maxPages = _maxPagesRepository.getSingle() ?? 0;
      final moviesMap = _localMovieRepository.getAll();
      final loadedPages = _localMovieRepository.getAll().keys.length;

      if (page > loadedPages) {
        final moviesRemoteResult = await _remoteMovieRepository.getMoviesPage(page: page);
        if (moviesRemoteResult is Value) {
          final moviesRemote = moviesRemoteResult.value!;
          await _localMovieRepository.putAt(key: moviesRemote.page, element: moviesRemote.movies);
          if (moviesRemote.total != maxPages) {
            await _maxPagesRepository.removeData();
            await _maxPagesRepository.setSingle(data: MaxPages(max: moviesRemote.total));
          }
        }
      }
      _isActive = false;
      movieStreamController
          .add(moviesMap.entries.where((element) => element.key <= page).map((e) => e.value).flattened.toList());
      return true;
    }
    return false;
  }

  @override
  Stream<List<Movie>> moviesStream() => movieStreamController.stream;
}
