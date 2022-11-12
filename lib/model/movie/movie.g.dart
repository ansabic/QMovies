// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MovieAdapter extends TypeAdapter<Movie> {
  @override
  final int typeId = 0;

  @override
  Movie read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Movie()
      .._adult = fields[0] as bool?
      .._backdropPath = fields[1] as String?
      .._genreIds = (fields[2] as List?)?.cast<num>()
      .._id = fields[3] as num?
      .._originalLanguage = fields[4] as String?
      .._originalTitle = fields[5] as String?
      .._overview = fields[6] as String?
      .._popularity = fields[7] as num?
      .._posterPath = fields[8] as String?
      .._releaseDate = fields[9] as String?
      .._title = fields[10] as String?
      .._video = fields[11] as bool?
      .._voteAverage = fields[12] as num?
      .._voteCount = fields[13] as num?;
  }

  @override
  void write(BinaryWriter writer, Movie obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj._adult)
      ..writeByte(1)
      ..write(obj._backdropPath)
      ..writeByte(2)
      ..write(obj._genreIds)
      ..writeByte(3)
      ..write(obj._id)
      ..writeByte(4)
      ..write(obj._originalLanguage)
      ..writeByte(5)
      ..write(obj._originalTitle)
      ..writeByte(6)
      ..write(obj._overview)
      ..writeByte(7)
      ..write(obj._popularity)
      ..writeByte(8)
      ..write(obj._posterPath)
      ..writeByte(9)
      ..write(obj._releaseDate)
      ..writeByte(10)
      ..write(obj._title)
      ..writeByte(11)
      ..write(obj._video)
      ..writeByte(12)
      ..write(obj._voteAverage)
      ..writeByte(13)
      ..write(obj._voteCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is MovieAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}
