import 'package:hive/hive.dart';
import 'package:q_movies/common/hive_type_id.dart';

part 'max_pages.g.dart';

@HiveType(typeId: HiveTypeId.maxPagesTypeId)
class MaxPages {
  @HiveField(0)
  final int max;

  MaxPages({required this.max});
}
