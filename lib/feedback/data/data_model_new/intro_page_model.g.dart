// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'intro_page_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class IntroPageAdapter extends TypeAdapter<IntroPage> {
  @override
  final int typeId = 13;

  @override
  IntroPage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return IntroPage(
      applyPageBackgroundImage: fields[0] as bool?,
      backgroundGalleryImageId: fields[1] as BackgroundGalleryImageId?,
      pageBgColor: fields[2] as String?,
      useCustomHeadingColor: fields[3] as bool?,
      pageLogoGalleryImageId: fields[4] as PageLogoGalleryImageId?,
      fontSizeGetStartButton: fields[5] as String?,
      fontColorGetStartButton: fields[6] as String?,
      fontFamilyGetStartButton: fields[7] as String?,
      bgColorGetStartButton: fields[8] as String?,
      buttonStyle: fields[9] as String?,
      fontSizeUpperText: fields[10] as String?,
      fontColorUpperText: fields[11] as String?,
      fontFamilyUpperText: fields[12] as String?,
      fontSizeBottomText: fields[13] as String?,
      fontColorBottomText: fields[14] as String?,
      fontFamilyBottomText: fields[15] as String?,
      translations: (fields[16] as Map?)?.cast<String, IntroPageTranslation>(),
      id: fields[17] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, IntroPage obj) {
    writer
      ..writeByte(18)
      ..writeByte(0)
      ..write(obj.applyPageBackgroundImage)
      ..writeByte(1)
      ..write(obj.backgroundGalleryImageId)
      ..writeByte(2)
      ..write(obj.pageBgColor)
      ..writeByte(3)
      ..write(obj.useCustomHeadingColor)
      ..writeByte(4)
      ..write(obj.pageLogoGalleryImageId)
      ..writeByte(5)
      ..write(obj.fontSizeGetStartButton)
      ..writeByte(6)
      ..write(obj.fontColorGetStartButton)
      ..writeByte(7)
      ..write(obj.fontFamilyGetStartButton)
      ..writeByte(8)
      ..write(obj.bgColorGetStartButton)
      ..writeByte(9)
      ..write(obj.buttonStyle)
      ..writeByte(10)
      ..write(obj.fontSizeUpperText)
      ..writeByte(11)
      ..write(obj.fontColorUpperText)
      ..writeByte(12)
      ..write(obj.fontFamilyUpperText)
      ..writeByte(13)
      ..write(obj.fontSizeBottomText)
      ..writeByte(14)
      ..write(obj.fontColorBottomText)
      ..writeByte(15)
      ..write(obj.fontFamilyBottomText)
      ..writeByte(16)
      ..write(obj.translations)
      ..writeByte(17)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IntroPageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
