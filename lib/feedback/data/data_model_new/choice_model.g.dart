// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'choice_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChoiceAdapter extends TypeAdapter<Choice> {
  @override
  final int typeId = 7;

  @override
  Choice read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Choice(
      logic: fields[0] as Logic?,
      choiceNodeId: fields[1] as String?,
      isNaChoice: fields[2] as bool?,
      choiceWeight: fields[3] as int?,
      markedCorrect: fields[4] as bool?,
      optionGalleryImageId: fields[5] as OptionGalleryImageId?,
      id: fields[6] as String?,
      translations: (fields[7] as Map).cast<String, ChoiceTranslation>(),
      preMongifiedId: fields[8] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Choice obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.logic)
      ..writeByte(1)
      ..write(obj.choiceNodeId)
      ..writeByte(2)
      ..write(obj.isNaChoice)
      ..writeByte(3)
      ..write(obj.choiceWeight)
      ..writeByte(4)
      ..write(obj.markedCorrect)
      ..writeByte(5)
      ..write(obj.optionGalleryImageId)
      ..writeByte(6)
      ..write(obj.id)
      ..writeByte(7)
      ..write(obj.translations)
      ..writeByte(8)
      ..write(obj.preMongifiedId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChoiceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
