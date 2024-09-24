// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_survey_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UpdateSurveyModelAdapter extends TypeAdapter<UpdateSurveyModel> {
  @override
  final int typeId = 37;

  @override
  UpdateSurveyModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UpdateSurveyModel(
      surveyId: fields[0] as String,
      modifiedDate: fields[1] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, UpdateSurveyModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.surveyId)
      ..writeByte(1)
      ..write(obj.modifiedDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UpdateSurveyModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
