import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:q_movies/common/result.dart';
import 'package:q_movies/model/movie_details/movie_details.dart';

import '../../repository/remote/remote_movie_details/remote_movie_details_repository.dart';

part 'movie_details_event.dart';

part 'movie_details_state.dart';

@singleton
class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final RemoteMovieDetailsRepository _remoteMovieDetailsRepository;

  MovieDetailsBloc(this._remoteMovieDetailsRepository) : super(MovieDetailsInitial()) {
    on<LoadMovieDetails>((event, emit) async {
      add(Loading());
      final result = await _remoteMovieDetailsRepository.getMovieDetails(movieId: event.movieId);
      if (result is Value && result.value != null) {
        final data = result.value!;
        emit(MovieDetailsLoaded(details: data));
      } else {
        emit(ErrorLoadingState());
      }
    });
    on<Loading>((event, emit) {
      emit(MovieDetailsInitial());
    });
  }
}
