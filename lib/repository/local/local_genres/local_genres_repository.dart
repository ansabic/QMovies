import 'package:injectable/injectable.dart';
import 'package:q_movies/data_source/local_data_source/impl/genres_data_source.dart';
import 'package:q_movies/model/genre/genre.dart';
import 'package:q_movies/repository/local/abstract/local_list_repository.dart';

@injectable
class LocalGenresRepository extends LocalListRepository<Genre> {
  final GenresDataSource genresDataSource;

  LocalGenresRepository(this.genresDataSource);

  @override
  List<Genre> getAllElements() {
    return genresDataSource.getAll();
  }

  @override
  bool hasElement({required Genre element}) {
    return genresDataSource.getAll().isNotEmpty;
  }

  @override
  Future<void> insertElement({required Genre element}) async {
    await genresDataSource.addItem(item: element);
  }

  @override
  Future<void> insertElements({required List<Genre> elements}) async {
    await genresDataSource.addItems(items: elements);
  }

  @override
  Future<void> removeAll() async {
    await genresDataSource.deleteAll();
  }

  @override
  Stream? watch() {
    return genresDataSource.watch();
  }

  @override
  Future<void> removeItem({required Genre element}) async {
    await genresDataSource.deleteItemInList(item: element);
  }
}
