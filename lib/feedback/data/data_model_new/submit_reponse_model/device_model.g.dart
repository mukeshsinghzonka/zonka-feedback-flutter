// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DeviceModelAdapter extends TypeAdapter<DeviceModel> {
  @override
  final int typeId = 5;

  @override
  DeviceModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DeviceModel(
      appVersion: fields[1] as String?,
      appVersionCode: fields[2] as String?,
      deviceBatteryLevel: fields[5] as String?,
      deviceOsVersion: fields[0] as String?,
      networkType: fields[3] as String?,
      syncType: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, DeviceModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.deviceOsVersion)
      ..writeByte(1)
      ..write(obj.appVersion)
      ..writeByte(2)
      ..write(obj.appVersionCode)
      ..writeByte(3)
      ..write(obj.networkType)
      ..writeByte(4)
      ..write(obj.syncType)
      ..writeByte(5)
      ..write(obj.deviceBatteryLevel);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DeviceModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
