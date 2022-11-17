import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:q_movies/common/assets.dart';
import 'package:q_movies/common/custom_colors.dart';
import 'package:q_movies/common/route_names.dart';
import 'package:q_movies/repository/local/local_genres/local_genres_repository.dart';
import 'package:q_movies/ui/details_screen/movie_details_bloc.dart';
import 'package:q_movies/ui/main_screen/favorites_screen/favorites_bloc.dart';

import '../../../../common/constants.dart';
import '../../../../di/di.dart';
import '../../../../model/movie/movie.dart';

class MovieItem extends StatelessWidget {
  final Movie movie;
  final double starSize = 16;
  final double pictureSize = 100;
  final double bottomPadding = 20;
  final double horizontalPadding = 20;
  final double imageRightPadding = 16;
  final double favoriteIconSize = 18;
  final bool picked;

  const MovieItem({Key? key, required this.movie, required this.picked}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final genres = getIt<LocalGenresRepository>()
        .getAllElements()
        .where((element) => movie.genreIds?.contains(element.id) == true)
        .toList();
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        getIt<MovieDetailsBloc>().add(LoadMovieDetails(movieId: movie.id?.toInt() ?? 0));
        Navigator.of(context).pushNamed(RouteNames.detailsScreen);
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: bottomPadding, left: horizontalPadding, right: horizontalPadding),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              "${Constants.imageStartUrl}${(movie.posterPath ?? "").replaceAll("file:///", "")}",
              width: pictureSize,
              height: pictureSize,
              fit: BoxFit.cover,
              errorBuilder: ((context, error, stackTrace) => Icon(
                    Icons.error,
                    size: pictureSize,
                    color: CustomColors.qOrange,
                  )),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: imageRightPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movie.title ?? "Unknown title",
                      style: const TextStyle(
                          color: CustomColors.almostWhite,
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
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
                              movie.voteAverage != 0
                                  ? "${movie.voteAverage?.toStringAsFixed(1) ?? "-"} / 10 IMDb"
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
                                    color: CustomColors.genreGrey, borderRadius: BorderRadius.circular(4)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                                  child: Text(
                                    e.name ?? "Unknown",
                                    style: const TextStyle(color: CustomColors.almostWhite, fontSize: 11),
                                  ),
                                ),
                              ),
                            );
                          }).toList()),
                        ))
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                    onTap: () => getIt<FavoritesBloc>().add(RefreshFavorites(movieClicked: movie)),
                    child: Image.asset(
                      picked ? Assets.favoritePicked : Assets.favoriteUnpicked,
                      width: favoriteIconSize,
                      height: favoriteIconSize,
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
