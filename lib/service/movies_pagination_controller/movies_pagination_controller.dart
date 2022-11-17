import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:q_movies/service/movies_pagination_controller/movies_pagination_controller_mixin.dart';
import 'package:q_movies/service/movies_pagination_controller/movies_pagination_event.dart';
import 'package:q_movies/service/movies_service/movies_event.dart';
import 'package:q_movies/service/movies_service/movies_service.dart';

import '../../di/di.dart';
import '../../repository/local/local_movie/local_movie_repository.dart';
import '../../repository/local/max_pages/max_pages_repository_impl.dart';
import 'movies_pagination_state.dart';

@singleton
class MoviesPaginationController extends Bloc<MoviesPaginationEvent, MoviesPaginationState>
    with IMoviesPaginationControllerMixin {
  final ScrollController _scrollController = ScrollController();
  final LocalMaxPagesRepository _maxPagesRepository;
  final LocalMovieRepository _localMovieRepository;
  final double refreshExtent = 300;

  @override
  ScrollController get scrollController => _scrollController;

  MoviesPaginationController(this._maxPagesRepository, this._localMovieRepository) : super(MoviesPaginationInitial()) {
    on<LoadNext>((event, emit) {
      getIt<MovieService>().add(CheckActivity(page: state.currentPage));
    });
    on<InitMoviesPagination>((event, emit) {
      _scrollController.addListener(scrollListener);
      emit(RefreshMoviesPagination(currentPage: getLoadedPages()));
    });
    on<CheckIfLoadNeeded>((event, emit) {
      if (state.currentPage <= getLoadedPages()) {
        emit(RefreshMoviesPagination(currentPage: state.currentPage + 1));
        add(LoadNext());
      }
    });
    add(InitMoviesPagination());
  }

  @override
  void scrollListener() {
    if (scrollController.position.extentAfter <= refreshExtent && state.currentPage != getMaxPage()) {
      add(CheckIfLoadNeeded());
    } else {}
  }

  @override
  int getMaxPage() {
    return _maxPagesRepository.getSingle()?.max ?? 0;
  }

  @override
  int getLoadedPages() => _localMovieRepository.getAll().keys.length;

  @override
  void dispose() {
    _scrollController.removeListener(scrollListener);
  }
}
