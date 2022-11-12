// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'max_pages.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MaxPagesAdapter extends TypeAdapter<MaxPages> {
  @override
  final int typeId = 1;

  @override
  MaxPages read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MaxPages(
      max: fields[0] as int,
    );
  }

  @override
  void write(BinaryWriter writer, MaxPages obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.max);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is MaxPagesAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}
