import 'package:injectable/injectable.dart';
import 'package:q_movies/model/movie_page/movie_page.dart';
import 'package:q_movies/model/popular_response/popular_response.dart';

@injectable
class PopularResponseToMoviePage {
  MoviePage execute({required PopularResponse popularResponse}) => MoviePage(
      movies: popularResponse.results ?? [],
      page: popularResponse.page?.toInt() ?? 0,
      total: popularResponse.totalPages?.toInt() ?? 0);
}
