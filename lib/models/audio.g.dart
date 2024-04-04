// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AudioAdapter extends TypeAdapter<Audio> {
  @override
  final int typeId = 4;

  @override
  Audio read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Audio(
      duration: fields[4] as int,
      position: fields[5] as int,
      name: fields[1] as String,
      audioPath: fields[2] as String,
      song: fields[3] as Song?,
      isPlay: fields[6] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Audio obj) {
    writer
      ..writeByte(7)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.audioPath)
      ..writeByte(3)
      ..write(obj.song)
      ..writeByte(4)
      ..write(obj.duration)
      ..writeByte(5)
      ..write(obj.position)
      ..writeByte(6)
      ..write(obj.isPlay)
      ..writeByte(7)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AudioAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
