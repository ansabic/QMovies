import 'package:q_movies/model/genre_response/genres_response.dart';

class ParseAllGenres {
  static GenresResponse execute(Map<String, dynamic> json) {
    return GenresResponse.fromJson(json);
  }
}
