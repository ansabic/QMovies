import 'package:injectable/injectable.dart';
import 'package:q_movies/model/movie/movie.dart';
import 'package:q_movies/repository/local/abstract/local_map_repository.dart';

@Injectable(as: LocalMapRepository<int, Movie>)
class LocalMovieRepositoryImpl implements LocalMapRepository<int, Movie> {
  @override
  Map<int, Movie> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  List<Movie> getAllElementsAt({required int key}) {
    // TODO: implement getAllElementsAt
    throw UnimplementedError();
  }

  @override
  Future<void> insertElementsAt({required int key, required List<Movie> elements}) {
    // TODO: implement insertElementsAt
    throw UnimplementedError();
  }

  @override
  Future<void> putAt({required int key, required Movie element}) {
    // TODO: implement putAt
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
