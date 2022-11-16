part of 'favorites_bloc.dart';

@immutable
abstract class FavoritesState {
  final List<Movie> favorites;

  const FavoritesState({required this.favorites});
}

class FavoritesInitial extends FavoritesState {
  FavoritesInitial() : super(favorites: []);
}

class RefreshedFavoritesState extends FavoritesState {
  const RefreshedFavoritesState({required super.favorites});
}
