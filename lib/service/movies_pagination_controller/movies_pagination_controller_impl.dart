import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:q_movies/service/movies_pagination_controller/movies_pagination_controller.dart';
import 'package:q_movies/service/movies_service/movies_service.dart';

import '../../repository/local/local_movie/local_movie_repository.dart';
import '../../repository/local/max_pages/max_pages_repository_impl.dart';

@Injectable(as: MoviesPaginationController)
class MoviesPaginationControllerImpl implements MoviesPaginationController {
  final ScrollController _scrollController = ScrollController();
  final LocalMaxPagesRepository _maxPagesRepository;
  final LocalMovieRepository _localMovieRepository;
  final double refreshExtent = 300;
  final MoviesService _moviesService;

  @override
  int currentPage = 0;

  @override
  ScrollController get scrollController => _scrollController;

  MoviesPaginationControllerImpl(this._maxPagesRepository, this._localMovieRepository, this._moviesService) {
    _scrollController.addListener(scrollListener);
  }

  @override
  void scrollListener() {
    if (scrollController.position.extentAfter <= refreshExtent && currentPage != getMaxPage()) {
      loadNext();
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

  void loadNext() {
    if (currentPage < getLoadedPages()) {
      currentPage++;
      _moviesService.syncMoviesMaxPage(page: currentPage);
    }
  }
}
