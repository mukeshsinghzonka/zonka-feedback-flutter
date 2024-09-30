// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_id.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CountryIdAdapter extends TypeAdapter<CountryId> {
  @override
  final int typeId = 42;

  @override
  CountryId read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CountryId(
      phoneCode: fields[0] as String?,
      id: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CountryId obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.phoneCode)
      ..writeByte(1)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CountryIdAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
