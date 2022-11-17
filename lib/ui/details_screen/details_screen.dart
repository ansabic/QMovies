import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:q_movies/repository/local/local_movie/local_movie_repository.dart';
import 'package:q_movies/ui/base_scaffold/base_scaffold.dart';

import '../../common/assets.dart';
import '../../common/constants.dart';
import '../../common/custom_colors.dart';
import '../../di/di.dart';
import '../main_screen/favorites_screen/favorites_bloc.dart';
import 'movie_details_bloc.dart';

class DetailsScreen extends StatelessWidget {
  final double pictureScreenRatio = 0.42;
  final double bottomOffset = 30;
  final double starSize = 16;
  final double favoriteIconSize = 18;

  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return BaseScaffold(
        child: MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: getIt<MovieDetailsBloc>(),
        ),
        BlocProvider.value(
          value: getIt<FavoritesBloc>(),
        ),
      ],
      child: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
        builder: (context, state) {
          if (state is MovieDetailsLoaded) {
            final genres = state.details.genres ?? [];
            return Stack(
              fit: StackFit.expand,
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  bottom: height * (1 - pictureScreenRatio),
                  child: Image.network(
                    fit: BoxFit.cover,
                    Constants.imageStartUrl + (state.details.posterPath ?? "").substring(1),
                    errorBuilder: (context, error, stackTrace) => const Icon(
                      Icons.error,
                      color: CustomColors.qOrange,
                    ),
                  ),
                ),
                Positioned(
                    left: 0,
                    right: 0,
                    top: height * pictureScreenRatio - bottomOffset,
                    bottom: 0,
                    child: Container(
                      decoration:
                          BoxDecoration(color: CustomColors.background, borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 28, left: 20, right: 20),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        state.details.title ?? "Unknown title",
                                        style: const TextStyle(
                                            color: CustomColors.almostWhite,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20,
                                            overflow: TextOverflow.ellipsis),
                                        maxLines: 2,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 4.0),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                right: 6.0,
                                              ),
                                              child: Image.asset(
                                                Assets.star,
                                                height: starSize,
                                                width: starSize,
                                              ),
                                            ),
                                            Text(
                                                state.details.voteAverage != 0
                                                    ? "${state.details.voteAverage?.toStringAsFixed(1) ?? "-"} / 10 IMDb"
                                                    : "-",
                                                style: const TextStyle(color: CustomColors.almostWhite, fontSize: 12))
                                          ],
                                        ),
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.only(top: 16.0),
                                          child: SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            physics: const BouncingScrollPhysics(),
                                            child: Row(
                                                children: genres.map((e) {
                                              return Padding(
                                                padding: const EdgeInsets.only(right: 4.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color: CustomColors.genreGrey,
                                                      borderRadius: BorderRadius.circular(4)),
                                                  child: Padding(
                                                    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                                                    child: Text(
                                                      e.name ?? "Unknown",
                                                      style: const TextStyle(
                                                          color: CustomColors.almostWhite, fontSize: 12),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }).toList()),
                                          ))
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    BlocBuilder<FavoritesBloc, FavoritesState>(
                                      builder: (context, favoritesState) {
                                        return GestureDetector(
                                            onTap: () => getIt<FavoritesBloc>().add(RefreshFavorites(
                                                movieClicked: getIt<LocalMovieRepository>()
                                                    .getAll()
                                                    .entries
                                                    .map((e) => e.value)
                                                    .flattened
                                                    .firstWhere((element) => element.id == state.details.id))),
                                            child: Image.asset(
                                              getIt<FavoritesBloc>()
                                                      .state
                                                      .favorites
                                                      .map((e) => e.id)
                                                      .contains(state.details.id)
                                                  ? Assets.favoritePicked
                                                  : Assets.favoriteUnpicked,
                                              width: favoriteIconSize,
                                              height: favoriteIconSize,
                                            ));
                                      },
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 40.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: const [
                                      Text(
                                        "Description",
                                        style: TextStyle(
                                            color: CustomColors.almostWhite, fontWeight: FontWeight.w600, fontSize: 15),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8),
                                    child: Text(
                                      state.details.overview ?? "No description",
                                      style: const TextStyle(
                                          color: CustomColors.almostWhite, fontWeight: FontWeight.w300, fontSize: 13),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )),
                Positioned(
                  top: 36,
                  left:24,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                      child: Image.asset(Assets.arrowLeft, width: 16, height: 16,)),)
              ],
            );
          } else if (state is MovieDetailsInitial) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else {
            return const Center(
              child: Text(
                "Error loading page",
                style: TextStyle(color: Colors.white),
              ),
            );
          }
        },
      ),
    ));
  }
}
