abstract class MoviesEvent {}

class InitMovies extends MoviesEvent {}

class SyncMoviesMaxPage extends MoviesEvent {
  final int page;

  SyncMoviesMaxPage({required this.page});
}

class CheckActivity extends MoviesEvent {
  final int page;

  CheckActivity({required this.page});
}
