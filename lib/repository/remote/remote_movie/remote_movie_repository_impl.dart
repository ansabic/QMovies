import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:q_movies/common/result.dart';
import 'package:q_movies/model/languages/language.dart';
import 'package:q_movies/repository/remote/remote_movie/remote_movie_repository.dart';

import '../../../common/common_exception.dart';
import '../../../data_source/remote_data_source/api_client.dart';
import '../../../model/movie_page/movie_page.dart';
import '../../../use_cases/mappers/popular_response_to_movie_movie_page.dart';
import '../../../use_cases/parsers/parse_popular_response.dart';

@Injectable(as: RemoteMovieRepository)
class RemoteMovieRepositoryImpl implements RemoteMovieRepository {
  final ApiClient _apiClient;
  final PopularResponseToMoviePage _popularResponseToMoviePage;

  RemoteMovieRepositoryImpl(this._apiClient, this._popularResponseToMoviePage);

  @override
  Future<Result<MoviePage, Exception>> getMoviesPage({Language language = Language.enUs, required int page}) async {
    try {
      final result = await _apiClient.getAllPopularPaginated(language: language, page: page);
      if (result.statusCode == 200) {
        final popularResponse = await compute(ParsePopularResponse.execute, (result.data ?? {}));
        final moviePage = _popularResponseToMoviePage.execute(popularResponse: popularResponse);
        return Value(moviePage);
      }
      return Error(ClientError(error: result.statusMessage ?? "Client error"));
    } on Exception catch (exception, _) {
      return Error(exception);
    }
  }
}
