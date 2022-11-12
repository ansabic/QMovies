import 'dart:async';

import '../../model/movie/movie.dart';

abstract class MoviesService {
  Stream<List<Movie>> moviesStream();

  void syncMoviesMaxPage({required int page});
}
