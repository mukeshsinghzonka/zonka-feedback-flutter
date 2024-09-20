// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TemplateModelAdapter extends TypeAdapter<TemplateModel> {
  @override
  final int typeId = 33;

  @override
  TemplateModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TemplateModel(
      id: fields[0] as String?,
      templateIndustries: (fields[1] as List?)?.cast<String>(),
      templateSubIndustries: (fields[2] as List?)?.cast<dynamic>(),
      thumbnailImage: fields[3] as String?,
      tags: (fields[4] as List?)?.cast<String>(),
      isPopularTemplate: fields[5] as bool?,
      isActive: fields[6] as bool?,
      refCode: fields[7] as String?,
      createdDate: fields[8] as DateTime?,
      surveyId: fields[9] as SurveyId?,
      fieldCount: fields[10] as int?,
      avgFillingTime: fields[11] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, TemplateModel obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.templateIndustries)
      ..writeByte(2)
      ..write(obj.templateSubIndustries)
      ..writeByte(3)
      ..write(obj.thumbnailImage)
      ..writeByte(4)
      ..write(obj.tags)
      ..writeByte(5)
      ..write(obj.isPopularTemplate)
      ..writeByte(6)
      ..write(obj.isActive)
      ..writeByte(7)
      ..write(obj.refCode)
      ..writeByte(8)
      ..write(obj.createdDate)
      ..writeByte(9)
      ..write(obj.surveyId)
      ..writeByte(10)
      ..write(obj.fieldCount)
      ..writeByte(11)
      ..write(obj.avgFillingTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TemplateModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
