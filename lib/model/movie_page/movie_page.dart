import '../movie/movie.dart';

class MoviePage {
  final List<Movie> movies;
  final int page;
  final int total;

  MoviePage({required this.movies, required this.page, required this.total});
}
