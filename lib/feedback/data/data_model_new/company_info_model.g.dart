// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_info_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CompanyInfoModelAdapter extends TypeAdapter<CompanyInfoModel> {
  @override
  final int typeId = 43;

  @override
  CompanyInfoModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CompanyInfoModel(
      name: fields[0] as String?,
      emailSurverySenderName: fields[1] as String?,
      emailSurveyEmailAddress: fields[2] as String?,
      emailSurveyVerified: fields[3] as bool?,
      sitename: fields[4] as String?,
      region: fields[5] as String?,
      countryId: fields[6] as CountryId?,
      timeZoneId: fields[7] as TimeZoneId?,
      locationModuleStatus: fields[8] as bool?,
      isActive: fields[9] as bool?,
      isDeleted: fields[10] as bool?,
      id: fields[11] as String?,
      logo: fields[12] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CompanyInfoModel obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.emailSurverySenderName)
      ..writeByte(2)
      ..write(obj.emailSurveyEmailAddress)
      ..writeByte(3)
      ..write(obj.emailSurveyVerified)
      ..writeByte(4)
      ..write(obj.sitename)
      ..writeByte(5)
      ..write(obj.region)
      ..writeByte(6)
      ..write(obj.countryId)
      ..writeByte(7)
      ..write(obj.timeZoneId)
      ..writeByte(8)
      ..write(obj.locationModuleStatus)
      ..writeByte(9)
      ..write(obj.isActive)
      ..writeByte(10)
      ..write(obj.isDeleted)
      ..writeByte(11)
      ..write(obj.id)
      ..writeByte(12)
      ..write(obj.logo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CompanyInfoModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
