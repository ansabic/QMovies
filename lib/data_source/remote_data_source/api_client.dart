import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:q_movies/common/constants.dart';
import 'package:q_movies/model/languages/language.dart';
import 'package:q_movies/use_cases/build_popular_paginated_queries.dart';

import 'client_endpoints.dart';
import 'endpoints_constants.dart';

@injectable
class ApiClient with ImdbEndpoints {
  static const baseHeaders = {"Authorization": Constants.bearerToken};
  final _dioClient = Dio(BaseOptions(baseUrl: EndpointsConstants.baseUrl, headers: baseHeaders));

  final BuildPopularPaginatedQuery _buildPopularPaginatedQuery;

  ApiClient(this._buildPopularPaginatedQuery);

  @override
  Future<Response<Map<String, dynamic>>> getAllPopularPaginated({required Language language, required int page}) async {
    const fullPath = EndpointsConstants.baseUrl + EndpointsConstants.popular;
    return await _dioClient.get(fullPath,
        queryParameters: _buildPopularPaginatedQuery.execute(language: language, page: page));
  }
}
