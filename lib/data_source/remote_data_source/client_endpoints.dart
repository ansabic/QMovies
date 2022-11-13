import 'package:dio/dio.dart';
import 'package:q_movies/model/languages/language.dart';

abstract class ImdbEndpoints {
  Future<Response<Map<String, dynamic>>> getAllPopularPaginated({required Language language, required int page});

  Future<Response<Map<String, dynamic>>> getAllGenres();
}
