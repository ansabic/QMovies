import 'dart:async';

import 'package:collection/collection.dart';
import 'package:injectable/injectable.dart';
import 'package:q_movies/model/movie/movie.dart';
import 'package:q_movies/repository/remote/remote_movie/remote_movie_repository.dart';
import 'package:q_movies/service/movies_service/movies_service.dart';

import '../../common/result.dart';
import '../../model/loaded_pages/max_pages.dart';
import '../../repository/local/abstract/local_list_repository.dart';
import '../../repository/local/abstract/local_map_repository.dart';

@Injectable(as: MoviesService)
class MovieServiceImpl implements MoviesService {
  final RemoteMovieRepository _remoteMovieRepository;
  final LocalMapRepository<int, Movie> _localMovieRepository;
  final LocalListRepository<MaxPages> _maxPagesRepository;

  bool _isActive = false;
  StreamController<List<Movie>> movieStreamController = StreamController();

  MovieServiceImpl(this._remoteMovieRepository, this._localMovieRepository, this._maxPagesRepository);

  @override
  void syncMoviesMaxPage({required int page}) async {
    if (!_isActive) {
      _isActive = true;
      final elements = _maxPagesRepository.getAllElements();
      final maxPages = elements.isNotEmpty ? elements.first.max : 0;
      final moviesMap = _localMovieRepository.getAll();
      final loadedPages = _localMovieRepository.getAll().keys.length;

      if (page > loadedPages) {
        final moviesRemoteResult = await _remoteMovieRepository.getMoviesPage(page: page);
        if (moviesRemoteResult is Value) {
          final moviesRemote = moviesRemoteResult.value!;
          await _localMovieRepository.putAt(key: moviesRemote.page, element: moviesRemote.movies);
          if (moviesRemote.total != maxPages) {
            await _maxPagesRepository.removeAll();
            await _maxPagesRepository.insertElement(element: MaxPages(max: moviesRemote.total));
          }
        }
      }
      _isActive = false;
      movieStreamController
          .add(moviesMap.entries.where((element) => element.key <= page).map((e) => e.value).flattened.toList());
    }
  }

  @override
  Stream<List<Movie>> moviesStream() => movieStreamController.stream;
}
