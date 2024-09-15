// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'choice_translation_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChoiceTranslationAdapter extends TypeAdapter<ChoiceTranslation> {
  @override
  final int typeId = 8;

  @override
  ChoiceTranslation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ChoiceTranslation(
      name: fields[0] as String?,
      helpText: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ChoiceTranslation obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.helpText);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChoiceTranslationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
