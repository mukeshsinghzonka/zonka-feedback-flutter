// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'option_gallery_image.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OptionGalleryImageIdAdapter extends TypeAdapter<OptionGalleryImageId> {
  @override
  final int typeId = 18;

  @override
  OptionGalleryImageId read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OptionGalleryImageId(
      path: fields[0] as String,
      id: fields[1] as String,
      companyId: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, OptionGalleryImageId obj) {
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
      other is OptionGalleryImageIdAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
