import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:q_movies/common/result.dart';
import 'package:q_movies/model/movie_details/movie_details.dart';
import 'package:q_movies/repository/remote/remote_movie_details/remote_movie_details_repository.dart';

import '../../../common/common_exception.dart';
import '../../../data_source/remote_data_source/api_client.dart';
import '../../../use_cases/parsers/parse_movie_details.dart';

@Injectable(as: RemoteMovieDetailsRepository)
class RemoteMovieDetailsRepositoryImpl extends RemoteMovieDetailsRepository {
  final ApiClient _apiClient;

  RemoteMovieDetailsRepositoryImpl(this._apiClient);
  @override
  Future<Result<MovieDetails, Exception>> getMovieDetails({required int movieId}) async {
    try {
      final result = await _apiClient.getAllMovieDetails(movieId: movieId,);
      if (result.statusCode == 200) {
        final movieDetails = await compute(ParseMovieDetails.execute, (result.data ?? {}));
        return Value(movieDetails);
      }
      return Error(ClientError(error: result.statusMessage ?? "Client error"));
    } on Exception catch (exception, _) {
      return Error(exception);
    }
  }

}