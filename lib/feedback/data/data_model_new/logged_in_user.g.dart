// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logged_in_user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LoggedInUserAdapter extends TypeAdapter<LoggedInUser> {
  @override
  final int typeId = 41;

  @override
  LoggedInUser read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LoggedInUser(
      userId: fields[0] as String?,
      isOwner: fields[1] as bool?,
      isActive: fields[2] as bool?,
      role: fields[3] as String?,
      isExpired: fields[4] as bool?,
      isFreeTrial: fields[5] as String?,
      spaUserId: fields[6] as dynamic,
      isSuperAdmin: fields[7] as dynamic,
      spaUserEmail: fields[8] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, LoggedInUser obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.userId)
      ..writeByte(1)
      ..write(obj.isOwner)
      ..writeByte(2)
      ..write(obj.isActive)
      ..writeByte(3)
      ..write(obj.role)
      ..writeByte(4)
      ..write(obj.isExpired)
      ..writeByte(5)
      ..write(obj.isFreeTrial)
      ..writeByte(6)
      ..write(obj.spaUserId)
      ..writeByte(7)
      ..write(obj.isSuperAdmin)
      ..writeByte(8)
      ..write(obj.spaUserEmail);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LoggedInUserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
