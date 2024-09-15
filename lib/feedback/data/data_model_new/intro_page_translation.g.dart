// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'intro_page_translation.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class IntroPageTranslationAdapter extends TypeAdapter<IntroPageTranslation> {
  @override
  final int typeId = 27;

  @override
  IntroPageTranslation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return IntroPageTranslation(
      getStarted: fields[0] as String?,
      upperText: fields[1] as String?,
      bottomText: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, IntroPageTranslation obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.getStarted)
      ..writeByte(1)
      ..write(obj.upperText)
      ..writeByte(2)
      ..write(obj.bottomText);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IntroPageTranslationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
