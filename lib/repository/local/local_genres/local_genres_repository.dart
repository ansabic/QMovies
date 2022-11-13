import 'package:injectable/injectable.dart';
import 'package:q_movies/data_source/local_data_source/local_data_source.dart';
import 'package:q_movies/model/genre/genre.dart';
import 'package:q_movies/repository/local/abstract/local_list_repository.dart';

@Injectable(as: LocalListRepository<Genre>)
class LocalGenresRepository extends LocalListRepository<Genre> {
  final LocalDataSource localDataSource;

  LocalGenresRepository(this.localDataSource);

  @override
  List<Genre> getAllElements() {
    return localDataSource.getAll<Genre>();
  }

  @override
  bool hasElement({required Genre element}) {
    return localDataSource.getAll<Genre>().isNotEmpty;
  }

  @override
  Future<void> insertElement({required Genre element}) async {
    await localDataSource.addItem<Genre>(item: element);
  }

  @override
  Future<void> insertElements({required List<Genre> elements}) async {
    await localDataSource.addItems<Genre>(items: elements);
  }

  @override
  Future<void> removeAll() async {
    await localDataSource.deleteAll<Genre>();
  }

  @override
  Stream? watch() {
    return localDataSource.watch<Genre>();
  }

  @override
  Future<void> removeItem({required Genre element}) async {
    await localDataSource.deleteItemInList<Genre>(item: element);
  }
}
