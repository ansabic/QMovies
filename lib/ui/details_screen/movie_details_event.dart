part of 'movie_details_bloc.dart';

@immutable
abstract class MovieDetailsEvent {}

class LoadMovieDetails extends MovieDetailsEvent {
  final int movieId;

  LoadMovieDetails({required this.movieId});
}

class Loading extends MovieDetailsEvent {}
