import 'package:injectable/injectable.dart';
import 'package:q_movies/data_source/local_data_source/impl/movies_data_source.dart';
import 'package:q_movies/model/movie/movie.dart';
import 'package:q_movies/repository/local/abstract/local_map_repository.dart';

@injectable
class LocalMovieRepository implements LocalMapRepository<int, Movie> {
  MoviesDataSource moviesDataSource;

  LocalMovieRepository(this.moviesDataSource);

  @override
  Map<int, List<Movie>> getAll() {
    return moviesDataSource.getDictionary();
  }

  @override
  List<Movie> getAllElementsAt({required int key}) {
    return moviesDataSource.getAt(key: key);
  }

  @override
  Future<void> putAt({required int key, required List<Movie> element}) async {
    await moviesDataSource.putAt(items: element, key: key);
  }

  @override
  Future<void> removeAll() async {
    await moviesDataSource.deleteAll();
  }
}
