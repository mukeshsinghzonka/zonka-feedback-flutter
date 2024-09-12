// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey_reponse_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SurveyResponseAdapter extends TypeAdapter<SurveyResponse> {
  @override
  final int typeId = 3;

  @override
  SurveyResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SurveyResponse(
      fieldId: fields[0] as String?,
      fieldValue: fields[1] as String?,
      choiceId: fields[2] as String?,
      optionId: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, SurveyResponse obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.fieldId)
      ..writeByte(1)
      ..write(obj.fieldValue)
      ..writeByte(2)
      ..write(obj.choiceId)
      ..writeByte(3)
      ..write(obj.optionId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SurveyResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
