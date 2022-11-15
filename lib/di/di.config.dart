// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data_source/local_data_source/abstract_hive/local_list_hive.dart' as _i8;
import '../data_source/local_data_source/abstract_hive/local_single_hive.dart' as _i9;
import '../data_source/local_data_source/impl/favorites_data_source.dart' as _i4;
import '../data_source/local_data_source/impl/genres_data_source.dart' as _i6;
import '../data_source/local_data_source/impl/max_pages_data_source.dart' as _i10;
import '../data_source/local_data_source/impl/movies_data_source.dart' as _i11;
import '../data_source/remote_data_source/api_client.dart' as _i13;
import '../repository/local/local_genres/local_genres_repository.dart' as _i7;
import '../repository/local/local_movie/local_movie_repository.dart' as _i15;
import '../repository/local/max_pages/max_pages_repository_impl.dart' as _i14;
import '../repository/remote/remote_genre/remote_genre_reposiotry_impl.dart' as _i17;
import '../repository/remote/remote_genre/remote_genre_repository.dart' as _i16;
import '../repository/remote/remote_movie/remote_movie_repository.dart' as _i18;
import '../repository/remote/remote_movie/remote_movie_repository_impl.dart' as _i19;
import '../service/genres_service/genres_service.dart' as _i20;
import '../service/genres_service/genres_service_impl.dart' as _i21;
import '../service/movies_pagination_controller/movies_pagination_controller.dart' as _i25;
import '../service/movies_pagination_controller/movies_pagination_controller_impl.dart' as _i26;
import '../service/movies_service/movies_service.dart' as _i22;
import '../service/movies_service/movies_service_impl.dart' as _i23;
import '../ui/splash_screen/splash_screen_bloc.dart' as _i24;
import '../use_cases/build_popular_paginated_queries.dart' as _i3;
import '../use_cases/format_to_basic_auth.dart' as _i5;
import '../use_cases/mappers/popular_response_to_movie_movie_page.dart' as _i12; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i4.FavoritesDataSource>(() => _i4.FavoritesDataSource());
  gh.factory<_i5.FormatToBasicAuth>(() => _i5.FormatToBasicAuth());
  gh.factory<_i6.GenresDataSource>(() => _i6.GenresDataSource());
  gh.factory<_i7.LocalGenresRepository>(() => _i7.LocalGenresRepository(get<_i6.GenresDataSource>()));
  gh.factory<_i8.LocalListHive<dynamic>>(() => _i8.LocalListHive<dynamic>());
  gh.factory<_i9.LocalSingleHive<dynamic>>(() => _i9.LocalSingleHive<dynamic>());
  gh.factory<_i10.MaxPagesDataSource>(() => _i10.MaxPagesDataSource());
  gh.factory<_i11.MoviesDataSource>(() => _i11.MoviesDataSource());
  gh.factory<_i12.PopularResponseToMoviePage>(() => _i12.PopularResponseToMoviePage());
  gh.factory<_i13.ApiClient>(() => _i13.ApiClient(get<_i3.BuildPopularPaginatedQuery>()));
  gh.factory<_i14.LocalMaxPagesRepository>(() => _i14.LocalMaxPagesRepository(get<_i10.MaxPagesDataSource>()));
  gh.factory<_i15.LocalMovieRepository>(() => _i15.LocalMovieRepository(get<_i11.MoviesDataSource>()));
  gh.factory<_i16.RemoteGenreRepository>(() => _i17.RemoteGenreRepositoryImpl(get<_i13.ApiClient>()));
  gh.factory<_i18.RemoteMovieRepository>(() => _i19.RemoteMovieRepositoryImpl(
        get<_i13.ApiClient>(),
        get<_i12.PopularResponseToMoviePage>(),
      ));
  gh.factory<_i20.GenresService>(() => _i21.GenresServiceImpl(
        get<_i16.RemoteGenreRepository>(),
        get<_i7.LocalGenresRepository>(),
      ));
  gh.factory<_i22.MoviesService>(() => _i23.MovieServiceImpl(
        get<_i18.RemoteMovieRepository>(),
        get<_i15.LocalMovieRepository>(),
        get<_i14.LocalMaxPagesRepository>(),
      ));
  gh.factory<_i24.SplashScreenBloc>(() => _i24.SplashScreenBloc(
        get<_i22.MoviesService>(),
        get<_i20.GenresService>(),
      ));
  gh.factory<_i25.MoviesPaginationController>(() => _i26.MoviesPaginationControllerImpl(
        get<_i14.LocalMaxPagesRepository>(),
        get<_i15.LocalMovieRepository>(),
        get<_i22.MoviesService>(),
      ));
  return get;
}
