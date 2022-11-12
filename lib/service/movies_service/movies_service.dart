import '../../model/movie/movie.dart';

abstract class MoviesService {
  List<Movie> getMoviesMaxPage({required int page});
}
