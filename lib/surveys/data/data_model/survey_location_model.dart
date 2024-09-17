

import 'package:hive/hive.dart';
import 'package:zonka_feedback/services/hive/hive_type_id.dart';

part 'survey_location_model.g.dart';

@HiveType(typeId: HiveTypeId.surveyLocationModelId)
class SurveyLocationModel extends HiveObject{

  @HiveField(0)
  final String address;
  @HiveField(1)
  final String locationId;
  @HiveField(2)
  final String locationName;

  SurveyLocationModel({
    required this.address,
    required this.locationId,
    required this.locationName,
  });

  Map<String, dynamic> toJson() {
    return {
      "Address": address,
      "LocationId": locationId,
      "LocationName": locationName,
    };
  }

  factory SurveyLocationModel.fromJson(Map<String, dynamic> json) {
    return SurveyLocationModel(
      address: json['address'] ?? "",
      locationId: json['_id'] ?? "",
      locationName: json['name'] ?? "",
    );
  }

  
}
