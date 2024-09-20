// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'template_industries_map.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TemplateIndustriesMapAdapter extends TypeAdapter<TemplateIndustriesMap> {
  @override
  final int typeId = 35;

  @override
  TemplateIndustriesMap read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TemplateIndustriesMap(
      id: fields[0] as String?,
      name: fields[1] as String?,
      description: fields[2] as String?,
      subCategories: (fields[3] as List?)?.cast<dynamic>(),
      showInWeb: fields[4] as bool?,
      showInApp: fields[5] as bool?,
      type: fields[6] as String?,
      icon: fields[7] as String?,
      heading: fields[8] as String?,
      subHeading: fields[9] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, TemplateIndustriesMap obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.subCategories)
      ..writeByte(4)
      ..write(obj.showInWeb)
      ..writeByte(5)
      ..write(obj.showInApp)
      ..writeByte(6)
      ..write(obj.type)
      ..writeByte(7)
      ..write(obj.icon)
      ..writeByte(8)
      ..write(obj.heading)
      ..writeByte(9)
      ..write(obj.subHeading);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TemplateIndustriesMapAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
