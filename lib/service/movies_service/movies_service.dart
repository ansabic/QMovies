import 'dart:async';

import '../../model/movie/movie.dart';

abstract class MoviesService {
  Stream<List<Movie>> moviesStream();

  Future<bool> syncMoviesMaxPage({required int page});
}
