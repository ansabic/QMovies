import 'package:flutter/widgets.dart';

import '../../../../model/movie/movie.dart';

class MovieItem extends StatelessWidget {
  final Movie movie;
  final double pictureSize = 100;

  const MovieItem({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.network(
          "https://image.tmdb.org/t/p/w500/${(movie.posterPath ?? "").replaceAll("file:///", "")}",
          width: pictureSize,
          height: pictureSize,
          fit: BoxFit.cover,
        )
      ],
    );
  }
}
