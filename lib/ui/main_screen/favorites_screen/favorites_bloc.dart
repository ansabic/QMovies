import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:q_movies/model/favorites/favorites.dart';

import '../../../model/movie/movie.dart';
import '../../../repository/local/favorites_repository/favorites_repository.dart';
import '../../../repository/local/local_movie/local_movie_repository.dart';

part 'favorites_event.dart';
part 'favorites_state.dart';

@lazySingleton
class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final FavoritesRepository _favoritesRepository;
  final LocalMovieRepository _localMovieRepository;

  FavoritesBloc(this._favoritesRepository, this._localMovieRepository) : super(FavoritesInitial()) {
    on<RefreshFavorites>((event, emit) async {
      if (_favoritesRepository.getAllElements().map((e) => e.id).contains(event.movieClicked.id)) {
        await _favoritesRepository.removeItem(
            element:
                _favoritesRepository.getAllElements().firstWhere((element) => element.id == event.movieClicked.id));
      } else {
        await _favoritesRepository.insertElement(element: Favorite(id: event.movieClicked.id?.toInt() ?? 0));
      }

      emit(RefreshedFavoritesState(favorites: getFavoriteMovies()));
    });
    on<InitFavorites>((event, emit) {
      emit(RefreshedFavoritesState(favorites: getFavoriteMovies()));
    });
    add(InitFavorites());
  }

  List<Movie> getFavoriteMovies() {
    return _localMovieRepository
        .getAll()
        .values
        .flattened
        .where((element) => _favoritesRepository.getAllElements().map((e) => e.id).contains(element.id))
        .toList();
  }
}
