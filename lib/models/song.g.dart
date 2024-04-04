// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'song.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SongAdapter extends TypeAdapter<Song> {
  @override
  final int typeId = 3;

  @override
  Song read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Song(
      name: fields[1] as String,
      text: fields[2] as String,
      comment: fields[4] as String?,
      executor: fields[3] as String,
      guitar: fields[5] as Guitar?,
      accessory: fields[6] as Accessory?,
    );
  }

  @override
  void write(BinaryWriter writer, Song obj) {
    writer
      ..writeByte(7)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.text)
      ..writeByte(3)
      ..write(obj.executor)
      ..writeByte(4)
      ..write(obj.comment)
      ..writeByte(5)
      ..write(obj.guitar)
      ..writeByte(6)
      ..write(obj.accessory)
      ..writeByte(7)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SongAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
