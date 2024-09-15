// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey_res_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SurveyResModelAdapter extends TypeAdapter<SurveyResModel> {
  @override
  final int typeId = 29;

  @override
  SurveyResModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SurveyResModel(
      surveyLocationList: (fields[10] as List).cast<SurveyLocationModel>(),
      viewMode: fields[1] as String,
      mode: fields[2] as String,
      defaultLanguageCode: fields[4] as String,
      isActive: fields[5] as bool,
      workSpaceId: fields[6] as String,
      surveyId: fields[7] as String,
      surveyName: fields[8] as String,
      surveyMongifiedId: fields[9] as int,
      iskioskmode: fields[3] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, SurveyResModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(10)
      ..write(obj.surveyLocationList)
      ..writeByte(1)
      ..write(obj.viewMode)
      ..writeByte(2)
      ..write(obj.mode)
      ..writeByte(3)
      ..write(obj.iskioskmode)
      ..writeByte(4)
      ..write(obj.defaultLanguageCode)
      ..writeByte(5)
      ..write(obj.isActive)
      ..writeByte(6)
      ..write(obj.workSpaceId)
      ..writeByte(7)
      ..write(obj.surveyId)
      ..writeByte(8)
      ..write(obj.surveyName)
      ..writeByte(9)
      ..write(obj.surveyMongifiedId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SurveyResModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
