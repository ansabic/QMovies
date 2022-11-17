abstract class MoviesPaginationState {
  final int currentPage;

  MoviesPaginationState({required this.currentPage});
}

class MoviesPaginationInitial extends MoviesPaginationState {
  MoviesPaginationInitial() : super(currentPage: 0);
}

class RefreshMoviesPagination extends MoviesPaginationState {
  RefreshMoviesPagination({required super.currentPage});
}
