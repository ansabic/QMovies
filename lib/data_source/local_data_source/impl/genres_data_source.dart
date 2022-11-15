import 'package:injectable/injectable.dart';
import 'package:q_movies/data_source/local_data_source/abstract_hive/local_list_hive.dart';
import 'package:q_movies/model/genre/genre.dart';

@injectable
class GenresDataSource extends LocalListHive<Genre> {}
