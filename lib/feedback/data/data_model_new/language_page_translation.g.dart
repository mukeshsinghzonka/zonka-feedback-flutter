// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_page_translation.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LanguagePageTranslationAdapter
    extends TypeAdapter<LanguagePageTranslation> {
  @override
  final int typeId = 15;

  @override
  LanguagePageTranslation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LanguagePageTranslation(
      upperText: fields[0] as String?,
      bottomText: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, LanguagePageTranslation obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.upperText)
      ..writeByte(1)
      ..write(obj.bottomText);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LanguagePageTranslationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
