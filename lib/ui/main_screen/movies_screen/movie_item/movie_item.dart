import 'package:flutter/widgets.dart';
import 'package:q_movies/common/assets.dart';
import 'package:q_movies/common/custom_colors.dart';
import 'package:q_movies/repository/local/local_genres/local_genres_repository.dart';

import '../../../../common/constants.dart';
import '../../../../di/di.dart';
import '../../../../model/movie/movie.dart';

class MovieItem extends StatelessWidget {
  final Movie movie;
  final double starSize = 16;
  final double pictureSize = 100;
  final double topPadding = 20;
  final double horizontalPadding = 20;
  final double imageRightPadding = 16;

  const MovieItem({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final genres = getIt<LocalGenresRepository>()
        .getAllElements()
        .where((element) => movie.genreIds?.contains(element.id) == true)
        .toList();
    return Padding(
      padding: EdgeInsets.only(top: horizontalPadding, left: horizontalPadding, right: horizontalPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            "${Constants.imageStartUrl}${(movie.posterPath ?? "").replaceAll("file:///", "")}",
            width: pictureSize,
            height: pictureSize,
            fit: BoxFit.cover,
          ),
          Padding(
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
                      Text(movie.voteAverage != 0 ? "${movie.voteAverage?.toStringAsFixed(1) ?? "-"} / 10 IMDb" : "-",
                          style: const TextStyle(color: CustomColors.almostWhite, fontSize: 12))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Row(
                    children: genres
                        .map((e) => Padding(
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
                            ))
                        .toList(),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
