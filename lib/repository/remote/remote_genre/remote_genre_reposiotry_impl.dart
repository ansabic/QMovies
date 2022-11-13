import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:q_movies/common/result.dart';
import 'package:q_movies/model/genre/genre.dart';
import 'package:q_movies/repository/remote/remote_genre/remote_genre_repository.dart';
import 'package:q_movies/use_cases/parsers/parse_all_genres.dart';

import '../../../common/common_exception.dart';
import '../../../data_source/remote_data_source/api_client.dart';

@Injectable(as: RemoteGenreRepository)
class RemoteGenreRepositoryImpl extends RemoteGenreRepository {
  final ApiClient _apiClient;

  RemoteGenreRepositoryImpl(this._apiClient);

  @override
  Future<Result<List<Genre>, Exception>> getAllGenres() async {
    try {
      final result = await _apiClient.getAllGenres();
      if (result.statusCode == 200) {
        final allGenres = await compute(ParseAllGenres.execute, (result.data ?? {}));

        return Value(allGenres.genres ?? []);
      }
      return Error(ClientError(error: result.statusMessage ?? "Client error"));
    } on Exception catch (exception, _) {
      return Error(exception);
    }
  }
}
