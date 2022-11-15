import 'package:injectable/injectable.dart';
import 'package:q_movies/data_source/local_data_source/abstract_hive/local_single_hive.dart';
import 'package:q_movies/model/loaded_pages/max_pages.dart';

@injectable
class MaxPagesDataSource extends LocalSingleHive<MaxPages> {}
