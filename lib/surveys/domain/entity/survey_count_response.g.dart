// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey_count_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SurveyCountResponseDataAdapter
    extends TypeAdapter<SurveyCountResponseData> {
  @override
  final int typeId = 32;

  @override
  SurveyCountResponseData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SurveyCountResponseData(
      count: fields[0] as int,
      dateTime: fields[1] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, SurveyCountResponseData obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.count)
      ..writeByte(1)
      ..write(obj.dateTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SurveyCountResponseDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
