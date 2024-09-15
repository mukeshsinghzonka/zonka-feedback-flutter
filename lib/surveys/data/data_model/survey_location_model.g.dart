// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey_location_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SurveyLocationModelAdapter extends TypeAdapter<SurveyLocationModel> {
  @override
  final int typeId = 16;

  @override
  SurveyLocationModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SurveyLocationModel(
      address: fields[0] as String,
      locationId: fields[1] as String,
      locationName: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SurveyLocationModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.address)
      ..writeByte(1)
      ..write(obj.locationId)
      ..writeByte(2)
      ..write(obj.locationName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SurveyLocationModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
