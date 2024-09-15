// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logic_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LogicAdapter extends TypeAdapter<Logic> {
  @override
  final int typeId = 16;

  @override
  Logic read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Logic(
      actionTaken: fields[0] as String?,
      skipToScreenOrQuestion: fields[1] as String?,
      showQuestionList: fields[2] as String?,
      hideQuestionList: fields[3] as String?,
      redirectUrl: fields[4] as String?,
      skipHideRedirectTo: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Logic obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.actionTaken)
      ..writeByte(1)
      ..write(obj.skipToScreenOrQuestion)
      ..writeByte(2)
      ..write(obj.showQuestionList)
      ..writeByte(3)
      ..write(obj.hideQuestionList)
      ..writeByte(4)
      ..write(obj.redirectUrl)
      ..writeByte(5)
      ..write(obj.skipHideRedirectTo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LogicAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
