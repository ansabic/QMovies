import 'package:injectable/injectable.dart';
import 'package:q_movies/data_source/local_data_source/local_data_source.dart';
import 'package:q_movies/model/loaded_pages/max_pages.dart';
import 'package:q_movies/repository/local/abstract/local_list_repository.dart';

@Injectable(as: LocalListRepository<MaxPages>)
class MaxPagesRepositoryImpl implements LocalListRepository<MaxPages> {
  LocalDataSource localDataSource;

  MaxPagesRepositoryImpl(this.localDataSource);

  @override
  List<MaxPages> getAllElements() {
    return localDataSource.getAll<MaxPages>();
  }

  @override
  bool hasElement({required MaxPages element}) {
    return localDataSource.getAll<MaxPages>().isNotEmpty;
  }

  @override
  Future<void> insertElement({required MaxPages element}) async {
    await localDataSource.addItem<MaxPages>(item: element);
  }

  @override
  Future<void> insertElements({required List<MaxPages> elements}) async {
    await localDataSource.addItems<MaxPages>(items: elements);
  }

  @override
  Future<void> removeAll() async {
    await localDataSource.deleteAll<MaxPages>();
  }

  @override
  Stream? watch() {
    return localDataSource.watch<MaxPages>();
  }
}
