import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:q_movies/common/hive_type_id.dart';

part 'genre.g.dart';

@HiveType(typeId: HiveTypeId.genreTypeId)
class Genre extends Equatable {
  const Genre(
    this._id,
    this._name,
  );

  Genre.fromJson(dynamic json)
      : _id = json['id'],
        _name = json['name'];

  @HiveField(0)
  final num? _id;
  @HiveField(1)
  final String? _name;

  Genre copyWith({
    num? id,
    String? name,
  }) =>
      Genre(
        id ?? _id,
        name ?? _name,
      );

  num? get id => _id;

  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    return map;
  }

  @override
  List<Object?> get props => [id, name];
}
