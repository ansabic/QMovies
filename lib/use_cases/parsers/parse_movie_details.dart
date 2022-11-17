import 'package:q_movies/model/movie_details/movie_details.dart';

class ParseMovieDetails {
  static MovieDetails execute(Map<String, dynamic> json) {
    return MovieDetails.fromJson(json);
  }
}