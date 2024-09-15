// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'display_logic_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DisplayLogicModelAdapter extends TypeAdapter<DisplayLogicModel> {
  @override
  final int typeId = 9;

  @override
  DisplayLogicModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DisplayLogicModel(
      fieldId: fields[0] as String?,
      actionTaken: fields[1] as String?,
      choiceId: fields[2] as String?,
      optionId: fields[3] as String?,
      refValue: fields[4] as String?,
      sequence: fields[5] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, DisplayLogicModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.fieldId)
      ..writeByte(1)
      ..write(obj.actionTaken)
      ..writeByte(2)
      ..write(obj.choiceId)
      ..writeByte(3)
      ..write(obj.optionId)
      ..writeByte(4)
      ..write(obj.refValue)
      ..writeByte(5)
      ..write(obj.sequence);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DisplayLogicModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
