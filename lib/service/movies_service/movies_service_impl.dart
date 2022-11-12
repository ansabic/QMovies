import 'package:injectable/injectable.dart';
import 'package:q_movies/model/movie/movie.dart';
import 'package:q_movies/repository/remote/remote_movie/remote_movie_repository.dart';
import 'package:q_movies/service/movies_service/movies_service.dart';

import '../../model/loaded_pages/max_pages.dart';
import '../../repository/local/abstract/local_list_repository.dart';
import '../../repository/local/abstract/local_map_repository.dart';
import '../loading_service/loading_movies_service.dart';

@Injectable(as: MoviesService)
class MovieServiceImpl implements MoviesService {
  final RemoteMovieRepository _remoteMovieRepository;
  final LocalMapRepository<int, Movie> _localMovieRepository;
  final LocalListRepository<MaxPages> _maxPagesRepository;
  final LoadingMoviesService _loadingMoviesService;

  MovieServiceImpl(
      this._remoteMovieRepository, this._localMovieRepository, this._maxPagesRepository, this._loadingMoviesService);

  @override
  List<Movie> getMoviesMaxPage({required int page}) {
    final elements = _maxPagesRepository.getAllElements();
    final maxPages = elements.isNotEmpty ? elements.first : 0;
    final moviesMap = _localMovieRepository.getAll();
    final loadedPages = _localMovieRepository.getAll().keys.length;

    if (page <= loadedPages) {
      return moviesMap.values.toList();
    } else {}
  }
}
