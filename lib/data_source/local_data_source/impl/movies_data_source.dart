import 'package:injectable/injectable.dart';

import '../../../model/movie/movie.dart';
import '../abstract_hive/local_map_list_hive.dart';

@injectable
class MoviesDataSource extends LocalMapListHive<int, Movie> {}
