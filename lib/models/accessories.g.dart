// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accessories.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AccessoryAdapter extends TypeAdapter<Accessory> {
  @override
  final int typeId = 1;

  @override
  Accessory read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Accessory(
      name: fields[1] as String,
      description: fields[2] as String,
      comment: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Accessory obj) {
    writer
      ..writeByte(4)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.comment)
      ..writeByte(4)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AccessoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
