// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_logo_gallery_image.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PageLogoGalleryImageIdAdapter
    extends TypeAdapter<PageLogoGalleryImageId> {
  @override
  final int typeId = 21;

  @override
  PageLogoGalleryImageId read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PageLogoGalleryImageId(
      id: fields[0] as String?,
      path: fields[1] as String?,
      compnayId: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, PageLogoGalleryImageId obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.path)
      ..writeByte(2)
      ..write(obj.compnayId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PageLogoGalleryImageIdAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
