// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data_source/local_data_source/abstract_hive/local_list_hive.dart' as _i10;
import '../data_source/local_data_source/abstract_hive/local_single_hive.dart' as _i11;
import '../data_source/local_data_source/impl/favorites_data_source.dart' as _i4;
import '../data_source/local_data_source/impl/genres_data_source.dart' as _i7;
import '../data_source/local_data_source/impl/max_pages_data_source.dart' as _i12;
import '../data_source/local_data_source/impl/movies_data_source.dart' as _i13;
import '../data_source/remote_data_source/api_client.dart' as _i15;
import '../repository/local/favorites_repository/favorites_repository.dart' as _i5;
import '../repository/local/local_genres/local_genres_repository.dart' as _i9;
import '../repository/local/local_movie/local_movie_repository.dart' as _i17;
import '../repository/local/max_pages/max_pages_repository_impl.dart' as _i16;
import '../repository/remote/remote_genre/remote_genre_reposiotry_impl.dart' as _i20;
import '../repository/remote/remote_genre/remote_genre_repository.dart' as _i19;
import '../repository/remote/remote_movie/remote_movie_repository.dart' as _i23;
import '../repository/remote/remote_movie/remote_movie_repository_impl.dart' as _i24;
import '../repository/remote/remote_movie_details/remote_movie_details_reposiotry_impl.dart' as _i22;
import '../repository/remote/remote_movie_details/remote_movie_details_repository.dart' as _i21;
import '../service/genres_service/genres_service.dart' as _i26;
import '../service/genres_service/genres_service_impl.dart' as _i27;
import '../service/movies_pagination_controller/movies_pagination_controller.dart' as _i18;
import '../service/movies_service/movies_service.dart' as _i29;
import '../ui/details_screen/movie_details_bloc.dart' as _i28;
import '../ui/internet_connection/internet_connection_bloc.dart' as _i8;
import '../ui/main_screen/favorites_screen/favorites_bloc.dart' as _i25;
import '../ui/splash_screen/splash_screen_bloc.dart' as _i30;
import '../use_cases/build_popular_paginated_queries.dart' as _i3;
import '../use_cases/format_to_basic_auth.dart' as _i6;
import '../use_cases/mappers/popular_response_to_movie_movie_page.dart' as _i14; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<_i5.FavoritesRepository>(() => _i5.FavoritesRepository(get<_i4.FavoritesDataSource>()));
  gh.factory<_i6.FormatToBasicAuth>(() => _i6.FormatToBasicAuth());
  gh.factory<_i7.GenresDataSource>(() => _i7.GenresDataSource());
  gh.singleton<_i8.InternetConnectionBloc>(_i8.InternetConnectionBloc());
  gh.factory<_i9.LocalGenresRepository>(() => _i9.LocalGenresRepository(get<_i7.GenresDataSource>()));
  gh.factory<_i10.LocalListHive<dynamic>>(() => _i10.LocalListHive<dynamic>());
  gh.factory<_i11.LocalSingleHive<dynamic>>(() => _i11.LocalSingleHive<dynamic>());
  gh.factory<_i12.MaxPagesDataSource>(() => _i12.MaxPagesDataSource());
  gh.factory<_i13.MoviesDataSource>(() => _i13.MoviesDataSource());
  gh.factory<_i14.PopularResponseToMoviePage>(() => _i14.PopularResponseToMoviePage());
  gh.factory<_i15.ApiClient>(() => _i15.ApiClient(get<_i3.BuildPopularPaginatedQuery>()));
  gh.factory<_i16.LocalMaxPagesRepository>(() => _i16.LocalMaxPagesRepository(get<_i12.MaxPagesDataSource>()));
  gh.factory<_i17.LocalMovieRepository>(() => _i17.LocalMovieRepository(get<_i13.MoviesDataSource>()));
  gh.singleton<_i18.MoviesPaginationController>(_i18.MoviesPaginationController(
    get<_i16.LocalMaxPagesRepository>(),
    get<_i17.LocalMovieRepository>(),
  ));
  gh.factory<_i19.RemoteGenreRepository>(() => _i20.RemoteGenreRepositoryImpl(get<_i15.ApiClient>()));
  gh.factory<_i21.RemoteMovieDetailsRepository>(() => _i22.RemoteMovieDetailsRepositoryImpl(get<_i15.ApiClient>()));
  gh.factory<_i23.RemoteMovieRepository>(() => _i24.RemoteMovieRepositoryImpl(
        get<_i15.ApiClient>(),
        get<_i14.PopularResponseToMoviePage>(),
      ));
  gh.lazySingleton<_i25.FavoritesBloc>(() => _i25.FavoritesBloc(
        get<_i5.FavoritesRepository>(),
        get<_i17.LocalMovieRepository>(),
      ));
  gh.factory<_i26.GenresService>(() => _i27.GenresServiceImpl(
        get<_i19.RemoteGenreRepository>(),
        get<_i9.LocalGenresRepository>(),
      ));
  gh.singleton<_i28.MovieDetailsBloc>(_i28.MovieDetailsBloc(get<_i21.RemoteMovieDetailsRepository>()));
  gh.singleton<_i29.MovieService>(_i29.MovieService(
    get<_i23.RemoteMovieRepository>(),
    get<_i17.LocalMovieRepository>(),
    get<_i16.LocalMaxPagesRepository>(),
  ));
  gh.factory<_i30.SplashScreenBloc>(() => _i30.SplashScreenBloc(get<_i26.GenresService>()));
  return get;
}
