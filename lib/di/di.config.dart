// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i16;

import 'package:flutter/cupertino.dart' as _i15;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data_source/local_data_source/hive_base.dart' as _i7;
import '../data_source/local_data_source/local_data_source.dart' as _i6;
import '../data_source/remote_data_source/api_client.dart' as _i19;
import '../model/loaded_pages/max_pages.dart' as _i9;
import '../model/movie/movie.dart' as _i12;
import '../repository/local/abstract/local_list_repository.dart' as _i8;
import '../repository/local/abstract/local_map_repository.dart' as _i11;
import '../repository/local/local_movie/local_movie_repository_impl.dart' as _i13;
import '../repository/local/max_pages_repository/max_pages_repository_impl.dart' as _i10;
import '../repository/remote/remote_movie/remote_movie_repository.dart' as _i20;
import '../repository/remote/remote_movie/remote_movie_repository_impl.dart' as _i21;
import '../service/loading_service/loading_movies_service.dart' as _i5;
import '../service/movies_pagination_controller/movies_pagination_controller.dart' as _i14;
import '../service/movies_pagination_controller/movies_pagination_controller_impl.dart' as _i17;
import '../service/movies_service/movies_service.dart' as _i22;
import '../service/movies_service/movies_service_impl.dart' as _i23;
import '../use_cases/build_popular_paginated_queries.dart' as _i3;
import '../use_cases/format_to_basic_auth.dart' as _i4;
import '../use_cases/mappers/popular_response_to_movie_movie_page.dart' as _i18; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.BuildPopularPaginatedQuery>(() => _i3.BuildPopularPaginatedQuery());
  gh.factory<_i4.FormatToBasicAuth>(() => _i4.FormatToBasicAuth());
  gh.singleton<_i5.LoadingMoviesService>(_i5.LoadingMoviesService());
  gh.factory<_i6.LocalDataSource>(() => _i7.HiveBase());
  gh.factory<_i8.LocalListRepository<_i9.MaxPages>>(() => _i10.MaxPagesRepositoryImpl());
  gh.factory<_i11.LocalMapRepository<int, _i12.Movie>>(() => _i13.LocalMovieRepositoryImpl());
  gh.factoryParam<_i14.MoviesPaginationController, _i15.ScrollController, _i16.StreamController<int>>((
    _scrollController,
    currentPageStreamController,
  ) =>
      _i17.MoviesPaginationControllerImpl(
        _scrollController,
        currentPageStreamController,
        get<_i8.LocalListRepository<_i9.MaxPages>>(),
        get<_i11.LocalMapRepository<int, _i12.Movie>>(),
        get<_i5.LoadingMoviesService>(),
      ));
  gh.factory<_i18.PopularResponseToMoviePage>(() => _i18.PopularResponseToMoviePage());
  gh.factory<_i19.ApiClient>(() => _i19.ApiClient(get<_i3.BuildPopularPaginatedQuery>()));
  gh.factory<_i20.RemoteMovieRepository>(() => _i21.RemoteMovieRepositoryImpl(
        get<_i19.ApiClient>(),
        get<_i18.PopularResponseToMoviePage>(),
      ));
  gh.factory<_i22.MoviesService>(() => _i23.MovieServiceImpl(
        get<_i20.RemoteMovieRepository>(),
        get<_i11.LocalMapRepository<int, _i12.Movie>>(),
        get<_i8.LocalListRepository<_i9.MaxPages>>(),
        get<_i5.LoadingMoviesService>(),
      ));
  return get;
}
