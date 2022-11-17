import '../../model/movie/movie.dart';

abstract class MoviesState {
  final List<Movie> movies;
  final bool active;

  MoviesState({required this.movies, required this.active});
}

class MoviesInitState extends MoviesState {
  MoviesInitState() : super(movies: [], active: false);
}

class MoviesRefreshedState extends MoviesState {
  MoviesRefreshedState({required super.movies, required super.active});
}

class InitialMoviesLoadedState extends MoviesState {
  InitialMoviesLoadedState({required super.movies, required super.active});
}
