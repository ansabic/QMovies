import 'package:q_movies/common/result.dart';
import 'package:q_movies/model/languages/language.dart';

import '../../../model/movie_page/movie_page.dart';

abstract class RemoteMovieRepository {
  Future<Result<MoviePage, Exception>> getMoviesPage({Language language, required int page});
}
