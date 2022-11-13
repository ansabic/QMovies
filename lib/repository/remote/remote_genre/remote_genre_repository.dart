import 'package:q_movies/model/genre/genre.dart';

import '../../../common/result.dart';

abstract class RemoteGenreRepository {
  Future<Result<List<Genre>, Exception>> getAllGenres();
}
