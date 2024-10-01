// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_survey_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UpdateSurveyModelValueAdapter
    extends TypeAdapter<UpdateSurveyModelValue> {
  @override
  final int typeId = 45;

  @override
  UpdateSurveyModelValue read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UpdateSurveyModelValue(
      countSurveyUpdated: fields[1] as int,
      surveyUpdateDateTime: fields[0] as DateTime,
      surveyId: (fields[2] as List?)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, UpdateSurveyModelValue obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.surveyUpdateDateTime)
      ..writeByte(1)
      ..write(obj.countSurveyUpdated)
      ..writeByte(2)
      ..write(obj.surveyId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UpdateSurveyModelValueAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
