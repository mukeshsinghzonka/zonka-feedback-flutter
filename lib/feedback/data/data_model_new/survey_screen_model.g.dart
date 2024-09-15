// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey_screen_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SurveyScreenModelAdapter extends TypeAdapter<SurveyScreenModel> {
  @override
  final int typeId = 25;

  @override
  SurveyScreenModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SurveyScreenModel(
      screenSequenceOrder: fields[0] as int?,
      columnLayout: fields[1] as String?,
      fields: (fields[2] as List).cast<Field>(),
    );
  }

  @override
  void write(BinaryWriter writer, SurveyScreenModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.screenSequenceOrder)
      ..writeByte(1)
      ..write(obj.columnLayout)
      ..writeByte(2)
      ..write(obj.fields);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SurveyScreenModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
