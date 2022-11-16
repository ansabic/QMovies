import 'package:hive/hive.dart';
import 'package:q_movies/common/hive_type_id.dart';

part 'favorites.g.dart';

@HiveType(typeId: HiveTypeId.favoritesTypeId)
class Favorite {
  @HiveField(0)
  final int id;

  const Favorite({required this.id});
}
