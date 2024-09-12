// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey_submit_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SurveySubmitModelAdapter extends TypeAdapter<SurveySubmitModel> {
  @override
  final int typeId = 2;

  @override
  SurveySubmitModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SurveySubmitModel(
      responseType: fields[0] as String?,
      timeZoneOffset: fields[1] as int?,
      companyId: fields[2] as String?,
      surveyId: fields[3] as String?,
      language: fields[5] as String?,
      ipAddress: fields[14] as String?,
      surveyStartDateTime: fields[6] as DateTime?,
      surveyFillStartDateTime: fields[7] as DateTime?,
      surveySubmitDateTime: fields[8] as DateTime?,
      surveyResponse: (fields[9] as List?)?.cast<SurveyResponse>(),
      syncType: fields[12] as String?,
      customer: fields[10] as Customer?,
      locationId: fields[4] as String?,
      deviceResponseRequestId: fields[13] as String?,
      deviceModel: fields[11] as DeviceModel?,
    );
  }

  @override
  void write(BinaryWriter writer, SurveySubmitModel obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.responseType)
      ..writeByte(1)
      ..write(obj.timeZoneOffset)
      ..writeByte(2)
      ..write(obj.companyId)
      ..writeByte(3)
      ..write(obj.surveyId)
      ..writeByte(4)
      ..write(obj.locationId)
      ..writeByte(5)
      ..write(obj.language)
      ..writeByte(6)
      ..write(obj.surveyStartDateTime)
      ..writeByte(7)
      ..write(obj.surveyFillStartDateTime)
      ..writeByte(8)
      ..write(obj.surveySubmitDateTime)
      ..writeByte(9)
      ..write(obj.surveyResponse)
      ..writeByte(10)
      ..write(obj.customer)
      ..writeByte(11)
      ..write(obj.deviceModel)
      ..writeByte(12)
      ..write(obj.syncType)
      ..writeByte(13)
      ..write(obj.deviceResponseRequestId)
      ..writeByte(14)
      ..write(obj.ipAddress);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SurveySubmitModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
