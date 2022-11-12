import 'package:injectable/injectable.dart';
import 'package:q_movies/model/loaded_pages/max_pages.dart';
import 'package:q_movies/repository/local/abstract/local_list_repository.dart';

@Injectable(as: LocalListRepository<MaxPages>)
class MaxPagesRepositoryImpl implements LocalListRepository<MaxPages> {
  @override
  List<MaxPages> getAllElements() {
    // TODO: implement getAllElements
    throw UnimplementedError();
  }

  @override
  bool hasElement({required MaxPages element}) {
    // TODO: implement hasElement
    throw UnimplementedError();
  }

  @override
  Future<void> insertElement({required MaxPages element}) {
    // TODO: implement insertElement
    throw UnimplementedError();
  }

  @override
  Future<void> insertElements({required List<MaxPages> elements}) {
    // TODO: implement insertElements
    throw UnimplementedError();
  }

  @override
  Future<void> removeAll() {
    // TODO: implement removeAll
    throw UnimplementedError();
  }

  @override
  Stream? watch() {
    // TODO: implement watch
    throw UnimplementedError();
  }
}
