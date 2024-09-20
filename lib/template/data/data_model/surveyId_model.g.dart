// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'surveyId_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SurveyIdAdapter extends TypeAdapter<SurveyId> {
  @override
  final int typeId = 34;

  @override
  SurveyId read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SurveyId(
      id: fields[0] as String?,
      name: fields[1] as String?,
      type: fields[2] as String?,
      description: fields[3] as String?,
      preMongifiedId: fields[4] as int?,
      viewMode: fields[5] as String?,
      mode: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, SurveyId obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.type)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.preMongifiedId)
      ..writeByte(5)
      ..write(obj.viewMode)
      ..writeByte(6)
      ..write(obj.mode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SurveyIdAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
