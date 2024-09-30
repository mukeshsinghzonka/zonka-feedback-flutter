// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_zone.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TimeZoneIdAdapter extends TypeAdapter<TimeZoneId> {
  @override
  final int typeId = 40;

  @override
  TimeZoneId read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TimeZoneId(
      timeZone: fields[0] as String,
      tzOffset: fields[1] as String,
      id: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TimeZoneId obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.timeZone)
      ..writeByte(1)
      ..write(obj.tzOffset)
      ..writeByte(2)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimeZoneIdAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
