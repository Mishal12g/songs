// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guitar.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GuitarAdapter extends TypeAdapter<Guitar> {
  @override
  final int typeId = 2;

  @override
  Guitar read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Guitar(
      typeGuitar: fields[1] as String,
      markGuitar: fields[2] as String,
      modelGuitar: fields[3] as String,
      comment: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Guitar obj) {
    writer
      ..writeByte(5)
      ..writeByte(1)
      ..write(obj.typeGuitar)
      ..writeByte(2)
      ..write(obj.markGuitar)
      ..writeByte(3)
      ..write(obj.modelGuitar)
      ..writeByte(4)
      ..write(obj.comment)
      ..writeByte(5)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GuitarAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
