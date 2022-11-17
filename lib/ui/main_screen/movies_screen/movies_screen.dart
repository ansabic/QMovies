import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:q_movies/service/movies_pagination_controller/movies_pagination_controller.dart';
import 'package:q_movies/service/movies_service/movies_service.dart';
import 'package:q_movies/service/movies_service/movies_state.dart';
import 'package:q_movies/ui/main_screen/favorites_screen/favorites_bloc.dart';
import 'package:q_movies/ui/main_screen/movies_screen/movie_item/movie_item.dart';
import 'package:q_movies/ui/main_screen/movies_screen/title/title.dart';

import '../../../di/di.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieService, MoviesState>(builder: (context, moviesState) {
      return Column(
        children: [
          const CustomTitle(title: "Popular"),
          Expanded(
            child: ListView.builder(
                controller: getIt<MoviesPaginationController>().scrollController,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: moviesState.movies.length,
                itemBuilder: (context, index) {
                  final item = moviesState.movies[index];
                  return BlocBuilder<FavoritesBloc, FavoritesState>(
                    builder: (context, favoritesState) {
                      return MovieItem(movie: item, picked: favoritesState.favorites.contains(item));
                    },
                  );
                }),
          ),
        ],
      );
    });
  }
}
