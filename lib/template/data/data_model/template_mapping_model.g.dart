// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template_mapping_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TemplateDataAdapter extends TypeAdapter<TemplateData> {
  @override
  final int typeId = 36;

  @override
  TemplateData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TemplateData(
      templateModelList: (fields[0] as List).cast<TemplateModel>(),
      templateIndustriesMap: (fields[1] as List).cast<TemplateIndustriesMap>(),
    );
  }

  @override
  void write(BinaryWriter writer, TemplateData obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.templateModelList)
      ..writeByte(1)
      ..write(obj.templateIndustriesMap);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TemplateDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
