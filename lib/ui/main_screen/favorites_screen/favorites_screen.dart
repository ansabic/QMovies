import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:q_movies/ui/main_screen/favorites_screen/favorites_bloc.dart';

import '../movies_screen/movie_item/movie_item.dart';
import '../movies_screen/title/title.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesBloc, FavoritesState>(
      builder: (context, state) {
        return Column(
          children: [
            const CustomTitle(title: "Favorites"),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: state.favorites.length,
                  itemBuilder: (context, index) => MovieItem(movie: state.favorites[index], picked: true)),
            ),
          ],
        );
      },
    );
  }
}
