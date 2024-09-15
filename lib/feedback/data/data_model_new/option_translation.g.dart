// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'option_translation.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OptionTranslationAdapter extends TypeAdapter<OptionTranslation> {
  @override
  final int typeId = 20;

  @override
  OptionTranslation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OptionTranslation(
      name: fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, OptionTranslation obj) {
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
      other is OptionTranslationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
