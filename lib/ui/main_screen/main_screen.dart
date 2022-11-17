import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:q_movies/di/di.dart';
import 'package:q_movies/model/main_pages/main_pages.dart';
import 'package:q_movies/service/movies_service/movies_service.dart';
import 'package:q_movies/ui/base_scaffold/base_scaffold.dart';
import 'package:q_movies/ui/common/error_screen.dart';
import 'package:q_movies/ui/details_screen/movie_details_bloc.dart';
import 'package:q_movies/ui/internet_connection/no_internet.dart';
import 'package:q_movies/ui/main_screen/favorites_screen/favorites_screen.dart';
import 'package:q_movies/ui/main_screen/movies_screen/base_header/base_header.dart';
import 'package:q_movies/ui/main_screen/movies_screen/movies_screen.dart';

import '../../service/movies_pagination_controller/movies_pagination_controller.dart';
import '../internet_connection/internet_connection_bloc.dart';
import 'bottom_nav/bottom_nav.dart';
import 'favorites_screen/favorites_bloc.dart';
import 'main_screen_bloc.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => getIt<InternetConnectionBloc>()),
          BlocProvider(
            create: (_) => MainScreenBloc(),
          ),
          BlocProvider(
            create: (_) => getIt<FavoritesBloc>(),
          ),
          BlocProvider(
            create: (_) => getIt<MoviesPaginationController>(),
          ),
          BlocProvider(
            create: (_) => getIt<MovieService>(),
          ),
          BlocProvider(
            create: (_) => getIt<MovieDetailsBloc>(),
          )
        ],
        child: Stack(fit: StackFit.expand, children: [
          Column(
            children: [
              const BaseHeader(),
              BlocBuilder<MainScreenBloc, MainScreenState>(
                builder: (context, state) {
                  final mainScreenBloc = BlocProvider.of<MainScreenBloc>(context);
                  return Expanded(
                    child: PageView.builder(
                      onPageChanged: (value) {
                        mainScreenBloc.add(ChangePageSwipe(page: value));
                      },
                      allowImplicitScrolling: true,
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: MainPages.values.length,
                      controller: mainScreenBloc.pageController,
                      itemBuilder: (_, index) {
                        switch (MainPages.getMainPageFromPage(page: index)) {
                          case MainPages.movies:
                            return const MoviesScreen();
                          case MainPages.favorites:
                            return const FavoritesScreen();
                          case null:
                            return const ErrorScreen();
                        }
                      },
                    ),
                  );
                },
              ),
              const BottomNav()
            ],
          ),
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: BlocBuilder<InternetConnectionBloc, InternetConnectionState>(
                builder: (context, state) {
                  return Visibility(
                    visible: !state.hasAccessToInternet,
                    child: const NoInternet(),
                  );
                },
              ))
        ]),
      ),
    );
  }
}
