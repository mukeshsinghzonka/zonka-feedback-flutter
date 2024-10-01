// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_name.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ServerNameModelAdapter extends TypeAdapter<ServerNameModel> {
  @override
  final int typeId = 44;

  @override
  ServerNameModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ServerNameModel(
      pin: fields[0] as String?,
      userId: fields[1] as String?,
      serverName: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ServerNameModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.pin)
      ..writeByte(1)
      ..write(obj.userId)
      ..writeByte(2)
      ..write(obj.serverName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ServerNameModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
