// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_city.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveCityAdapter extends TypeAdapter<HiveCity> {
  @override
  final int typeId = 1;

  @override
  HiveCity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveCity(
      name: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HiveCity obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveCityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
