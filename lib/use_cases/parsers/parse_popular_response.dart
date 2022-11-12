import 'package:q_movies/model/popular_response/popular_response.dart';

class ParsePopularResponse {
  static PopularResponse execute(Map<String, dynamic> json) => PopularResponse.fromJson(json);
}
