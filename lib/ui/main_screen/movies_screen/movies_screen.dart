import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:q_movies/model/movie/movie.dart';
import 'package:q_movies/repository/local/abstract/local_map_repository.dart';
import 'package:q_movies/service/movies_service/movies_service.dart';
import 'package:q_movies/ui/main_screen/movies_screen/movie_item/movie_item.dart';

import '../../../di/di.dart';
import '../../../service/movies_pagination_controller/movies_pagination_controller.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Movie>>(
        initialData: getIt<LocalMapRepository<int, Movie>>().getAll().values.flattened.toList(),
        stream: getIt<MoviesService>().moviesStream(),
        builder: (context, movies) {
          return ListView.builder(
              controller: getIt<MoviesPaginationController>().scrollController,
              shrinkWrap: true,
              itemCount: (movies.data ?? []).length,
              itemBuilder: (context, index) => MovieItem(movie: (movies.data ?? [])[index]));
        });
  }
}
