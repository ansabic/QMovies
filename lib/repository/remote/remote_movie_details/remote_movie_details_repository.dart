import 'package:q_movies/model/movie_details/movie_details.dart';

import '../../../common/result.dart';

abstract class RemoteMovieDetailsRepository {
  Future<Result<MovieDetails, Exception>> getMovieDetails({required int movieId});

}