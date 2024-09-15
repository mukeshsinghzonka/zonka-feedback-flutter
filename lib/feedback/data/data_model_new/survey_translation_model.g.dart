// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey_translation_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SurveyTranslationAdapter extends TypeAdapter<SurveyTranslation> {
  @override
  final int typeId = 26;

  @override
  SurveyTranslation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SurveyTranslation(
      clearButText: fields[0] as String?,
      getStartedButText: fields[1] as String?,
      nextArrowText: fields[2] as String?,
      previousArrowText: fields[3] as String?,
      skipNavText: fields[4] as String?,
      submitButtonText: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, SurveyTranslation obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.clearButText)
      ..writeByte(1)
      ..write(obj.getStartedButText)
      ..writeByte(2)
      ..write(obj.nextArrowText)
      ..writeByte(3)
      ..write(obj.previousArrowText)
      ..writeByte(4)
      ..write(obj.skipNavText)
      ..writeByte(5)
      ..write(obj.submitButtonText);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SurveyTranslationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
