// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filed_translation_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FieldTranslationAdapter extends TypeAdapter<FieldTranslation> {
  @override
  final int typeId = 11;

  @override
  FieldTranslation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FieldTranslation(
      placeHolder: fields[0] as String?,
      fieldLabel: fields[1] as String?,
      subTitle: fields[2] as String?,
      helpTextFirstOption: fields[3] as String?,
      helpTextLastOption: fields[4] as String?,
      invalidFieldMessage: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, FieldTranslation obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.placeHolder)
      ..writeByte(1)
      ..write(obj.fieldLabel)
      ..writeByte(2)
      ..write(obj.subTitle)
      ..writeByte(3)
      ..write(obj.helpTextFirstOption)
      ..writeByte(4)
      ..write(obj.helpTextLastOption)
      ..writeByte(5)
      ..write(obj.invalidFieldMessage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FieldTranslationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
