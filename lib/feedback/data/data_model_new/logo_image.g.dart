// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logo_image.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LogoGalleryImageIdAdapter extends TypeAdapter<LogoGalleryImageId> {
  @override
  final int typeId = 17;

  @override
  LogoGalleryImageId read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LogoGalleryImageId(
      path: fields[0] as String,
      id: fields[1] as String,
      companyId: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, LogoGalleryImageId obj) {
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
      other is LogoGalleryImageIdAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
