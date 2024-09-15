// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey_background_image.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SurveyBgGalleryImageIdAdapter
    extends TypeAdapter<SurveyBgGalleryImageId> {
  @override
  final int typeId = 22;

  @override
  SurveyBgGalleryImageId read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SurveyBgGalleryImageId(
      path: fields[0] as String,
      id: fields[1] as String,
      companyId: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SurveyBgGalleryImageId obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.path)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.companyId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SurveyBgGalleryImageIdAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
