// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_page_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LanguagePageAdapter extends TypeAdapter<LanguagePage> {
  @override
  final int typeId = 28;

  @override
  LanguagePage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LanguagePage(
      applyPageBackgroundImage: fields[0] as bool?,
      backgroundGalleryImageId: fields[1] as BackgroundGalleryImageId?,
      pageBgColor: fields[2] as String?,
      useCustomHeadingColor: fields[3] as bool?,
      pageLogoGalleryImageId: fields[4] as PageLogoGalleryImageId?,
      fontSizeLanguageButton: fields[5] as String?,
      fontColorLanguageButton: fields[6] as String?,
      fontFamilyLanguageButton: fields[7] as String?,
      bgColorLanguageButton: fields[8] as String?,
      fontSizeUpperText: fields[9] as String?,
      fontColorUpperText: fields[10] as String?,
      fontFamilyUpperText: fields[11] as String?,
      fontSizeBottomText: fields[12] as String?,
      fontColorBottomText: fields[13] as String?,
      fontFamilyBottomText: fields[14] as String?,
      showFlagWithLanguage: fields[15] as bool?,
      translations:
          (fields[16] as Map?)?.cast<String, LanguagePageTranslation>(),
      id: fields[17] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, LanguagePage obj) {
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
      ..write(obj.fontSizeLanguageButton)
      ..writeByte(6)
      ..write(obj.fontColorLanguageButton)
      ..writeByte(7)
      ..write(obj.fontFamilyLanguageButton)
      ..writeByte(8)
      ..write(obj.bgColorLanguageButton)
      ..writeByte(9)
      ..write(obj.fontSizeUpperText)
      ..writeByte(10)
      ..write(obj.fontColorUpperText)
      ..writeByte(11)
      ..write(obj.fontFamilyUpperText)
      ..writeByte(12)
      ..write(obj.fontSizeBottomText)
      ..writeByte(13)
      ..write(obj.fontColorBottomText)
      ..writeByte(14)
      ..write(obj.fontFamilyBottomText)
      ..writeByte(15)
      ..write(obj.showFlagWithLanguage)
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
      other is LanguagePageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
