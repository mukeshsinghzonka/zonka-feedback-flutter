// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workspace_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WorkspaceModelAdapter extends TypeAdapter<WorkspaceModel> {
  @override
  final int typeId = 31;

  @override
  WorkspaceModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WorkspaceModel(
      workSpaceId: fields[0] as String,
      workSpaceName: fields[1] as String,
      companyId: fields[2] as String,
      isFirstWorkspace: fields[4] as bool,
      widgetCodeInstalled: fields[3] as bool,
      modifiedByName: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, WorkspaceModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.workSpaceId)
      ..writeByte(1)
      ..write(obj.workSpaceName)
      ..writeByte(2)
      ..write(obj.companyId)
      ..writeByte(3)
      ..write(obj.widgetCodeInstalled)
      ..writeByte(4)
      ..write(obj.isFirstWorkspace)
      ..writeByte(5)
      ..write(obj.modifiedByName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WorkspaceModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
