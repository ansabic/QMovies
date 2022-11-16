import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:q_movies/di/di.dart';
import 'package:q_movies/model/main_pages/main_pages.dart';
import 'package:q_movies/ui/base_scaffold/base_scaffold.dart';
import 'package:q_movies/ui/common/error_screen.dart';
import 'package:q_movies/ui/main_screen/favorites_screen/favorites_screen.dart';
import 'package:q_movies/ui/main_screen/movies_screen/movies_screen.dart';

import 'bottom_nav/bottom_nav.dart';
import 'favorites_screen/favorites_bloc.dart';
import 'main_screen_bloc.dart';
import 'movies_screen/base_header/base_header.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => MainScreenBloc(),
          ),
          BlocProvider(
            create: (_) => getIt<FavoritesBloc>(),
          ),
        ],
        child: Column(
          children: [
            const BaseHeader(),
            BlocBuilder<MainScreenBloc, MainScreenState>(
              builder: (context, state) {
                final mainScreenBloc = BlocProvider.of<MainScreenBloc>(context);
                return Expanded(
                  child: PageView.builder(
                    onPageChanged: (value) {
                      mainScreenBloc.add(ChangePage(page: value));
                    },
                    itemCount: MainPages.values.length,
                    controller: mainScreenBloc.pageController,
                    itemBuilder: (context, index) {
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
      ),
    );
  }
}
