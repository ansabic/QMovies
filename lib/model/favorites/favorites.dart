import 'package:hive/hive.dart';
import 'package:q_movies/common/hive_type_id.dart';

part 'favorites.g.dart';

@HiveType(typeId: HiveTypeId.favoritesTypeId)
class Favorites {
  @HiveField(0)
  final List<int> ids;

  const Favorites({required this.ids});
}
