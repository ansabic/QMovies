import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:q_movies/model/loaded_pages/max_pages.dart';
import 'package:q_movies/repository/local/abstract/local_list_repository.dart';
import 'package:q_movies/repository/local/abstract/local_map_repository.dart';
import 'package:q_movies/service/movies_pagination_controller/movies_pagination_controller.dart';
import 'package:q_movies/service/movies_service/movies_service.dart';

import '../../model/movie/movie.dart';

@Injectable(as: MoviesPaginationController)
class MoviesPaginationControllerImpl implements MoviesPaginationController {
  final ScrollController _scrollController = ScrollController();
  final LocalListRepository<MaxPages> _maxPagesRepository;
  final LocalMapRepository<int, Movie> _localMovieRepository;
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
    final loadedData = _maxPagesRepository.getAllElements();
    return loadedData.isNotEmpty ? loadedData.first.max : 0;
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
