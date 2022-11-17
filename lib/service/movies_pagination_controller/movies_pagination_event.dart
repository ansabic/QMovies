abstract class MoviesPaginationEvent {}

class InitMoviesPagination extends MoviesPaginationEvent {}

class CheckIfLoadNeeded extends MoviesPaginationEvent {}

class LoadNext extends MoviesPaginationEvent {}
