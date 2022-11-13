import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:q_movies/model/main_pages/main_pages.dart';
import 'package:q_movies/ui/base_scaffold/base_scaffold.dart';
import 'package:q_movies/ui/common/error_screen.dart';
import 'package:q_movies/ui/main_screen/favorites_screen/favorites_screen.dart';
import 'package:q_movies/ui/main_screen/movies_screen/movies_screen.dart';

import 'main_screen_bloc.dart';
import 'movies_screen/base_header/base_header.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      child: BlocProvider(
        create: (_) => MainScreenBloc(),
        child: Column(
          children: [
            const BaseHeader(),
            BlocBuilder<MainScreenBloc, MainScreenState>(
              builder: (context, state) {
                final mainScreenBloc = BlocProvider.of<MainScreenBloc>(context);
                return Expanded(
                  child: PageView.builder(
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
          ],
        ),
      ),
    );
  }
}
