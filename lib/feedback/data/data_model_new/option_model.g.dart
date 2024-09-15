// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'option_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OptionAdapter extends TypeAdapter<Option> {
  @override
  final int typeId = 19;

  @override
  Option read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Option(
      optionNodeId: fields[0] as String?,
      id: fields[1] as String?,
      translations: (fields[2] as Map?)?.cast<String, OptionTranslation>(),
      preMongifiedId: fields[3] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Option obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.optionNodeId)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.translations)
      ..writeByte(3)
      ..write(obj.preMongifiedId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OptionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
