// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thankyou_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ThankyouPageAdapter extends TypeAdapter<ThankyouPage> {
  @override
  final int typeId = 23;

  @override
  ThankyouPage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ThankyouPage(
      applyPageBackgroundImage: fields[0] as bool?,
      backgroundGalleryImageId: fields[1] as BackgroundGalleryImageId?,
      pageBgColor: fields[2] as String?,
      useCustomHeadingColor: fields[3] as bool?,
      fontColorBottomText: fields[4] as String?,
      pageLogoGalleryImageId: fields[5] as PageLogoGalleryImageId?,
      fontColorUpperText: fields[6] as String?,
      fontSizeUpperText: fields[7] as String?,
      fontSizeBottomText: fields[8] as String?,
      fontFamilyUpperText: fields[9] as String?,
      fontFamilyBottomText: fields[10] as String?,
      translations:
          (fields[11] as Map?)?.cast<String, LanguagePageTranslation>(),
      id: fields[12] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ThankyouPage obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.applyPageBackgroundImage)
      ..writeByte(1)
      ..write(obj.backgroundGalleryImageId)
      ..writeByte(2)
      ..write(obj.pageBgColor)
      ..writeByte(3)
      ..write(obj.useCustomHeadingColor)
      ..writeByte(4)
      ..write(obj.fontColorBottomText)
      ..writeByte(5)
      ..write(obj.pageLogoGalleryImageId)
      ..writeByte(6)
      ..write(obj.fontColorUpperText)
      ..writeByte(7)
      ..write(obj.fontSizeUpperText)
      ..writeByte(8)
      ..write(obj.fontSizeBottomText)
      ..writeByte(9)
      ..write(obj.fontFamilyUpperText)
      ..writeByte(10)
      ..write(obj.fontFamilyBottomText)
      ..writeByte(11)
      ..write(obj.translations)
      ..writeByte(12)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ThankyouPageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
