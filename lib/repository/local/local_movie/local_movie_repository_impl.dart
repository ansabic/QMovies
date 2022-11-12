import 'package:injectable/injectable.dart';
import 'package:q_movies/data_source/local_data_source/local_data_source.dart';
import 'package:q_movies/model/movie/movie.dart';
import 'package:q_movies/repository/local/abstract/local_map_repository.dart';

@Injectable(as: LocalMapRepository<int, Movie>)
class LocalMovieRepositoryImpl implements LocalMapRepository<int, Movie> {
  LocalDataSource localDataSource;

  LocalMovieRepositoryImpl(this.localDataSource);

  @override
  Map<int, List<Movie>> getAll() {
    return localDataSource.getDictionary<int, Movie>();
  }

  @override
  List<Movie> getAllElementsAt({required int key}) {
    return localDataSource.getAt<int, Movie>(key: key);
  }

  @override
  Future<void> putAt({required int key, required List<Movie> element}) async {
    await localDataSource.putAt<int, Movie>(items: element, key: key);
  }

  @override
  Future<void> removeAll() async {
    await localDataSource.deleteAll<Movie>();
  }

  @override
  Stream? watch() {
    return localDataSource.watch<Movie>();
  }
}
