// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'udpate_survey_res_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UpdateSurveyResModelAdapter extends TypeAdapter<UpdateSurveyResModel> {
  @override
  final int typeId = 38;

  @override
  UpdateSurveyResModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UpdateSurveyResModel(
      updatesAvailable: fields[0] as bool,
      isDeleted: fields[1] as bool,
      surveyId: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UpdateSurveyResModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.updatesAvailable)
      ..writeByte(1)
      ..write(obj.isDeleted)
      ..writeByte(2)
      ..write(obj.surveyId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UpdateSurveyResModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
