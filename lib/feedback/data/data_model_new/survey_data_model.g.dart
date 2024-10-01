// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey_data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SurveyDataModelAdapter extends TypeAdapter<SurveyDataModel> {
  @override
  final int typeId = 39;

  @override
  SurveyDataModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SurveyDataModel(
      surveyModel: fields[0] as SurveyModel?,
      distribution: fields[1] as dynamic,
      companyInfoModel: fields[3] as CompanyInfoModel?,
      trackingInfo: fields[2] as dynamic,
      s3GalleryImageUrl: fields[4] as String?,
      loggedInUser: fields[5] as LoggedInUser?,
      serveNameModel: (fields[6] as List?)?.cast<ServerNameModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, SurveyDataModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.surveyModel)
      ..writeByte(1)
      ..write(obj.distribution)
      ..writeByte(2)
      ..write(obj.trackingInfo)
      ..writeByte(3)
      ..write(obj.companyInfoModel)
      ..writeByte(4)
      ..write(obj.s3GalleryImageUrl)
      ..writeByte(5)
      ..write(obj.loggedInUser)
      ..writeByte(6)
      ..write(obj.serveNameModel);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SurveyDataModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
