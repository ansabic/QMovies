import 'package:injectable/injectable.dart';
import 'package:q_movies/data_source/local_data_source/impl/favorites_data_source.dart';
import 'package:q_movies/model/favorites/favorites.dart';

import '../abstract/local_list_repository.dart';

@injectable
class FavoritesRepository implements LocalListRepository<Favorite> {
  final FavoritesDataSource favoritesDataSource;

  FavoritesRepository(this.favoritesDataSource);

  @override
  List<Favorite> getAllElements() {
    return favoritesDataSource.getAll();
  }

  @override
  bool hasElement({required Favorite element}) {
    return getAllElements().isNotEmpty;
  }

  @override
  Future<void> insertElement({required Favorite element}) async {
    await favoritesDataSource.addItem(item: element);
  }

  @override
  Future<void> insertElements({required List<Favorite> elements}) async {
    await favoritesDataSource.addItems(items: elements);
  }

  @override
  Future<void> removeAll() async {
    await favoritesDataSource.deleteAll();
  }

  @override
  Future<void> removeItem({required Favorite element}) async {
    await favoritesDataSource.deleteItemInList(item: element);
  }

  @override
  Stream? watch() {
    return favoritesDataSource.watch();
  }
}
