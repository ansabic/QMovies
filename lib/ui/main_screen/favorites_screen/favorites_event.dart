part of 'favorites_bloc.dart';

@immutable
abstract class FavoritesEvent {}

class RefreshFavorites extends FavoritesEvent {
  final Movie movieClicked;

  RefreshFavorites({required this.movieClicked});
}
