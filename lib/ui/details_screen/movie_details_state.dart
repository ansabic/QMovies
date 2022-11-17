part of 'movie_details_bloc.dart';

@immutable
abstract class MovieDetailsState {}

class MovieDetailsInitial extends MovieDetailsState {}

class MovieDetailsLoaded extends MovieDetailsState {
  final MovieDetails details;

  MovieDetailsLoaded({required this.details});
}

class ErrorLoadingState extends MovieDetailsState {}
