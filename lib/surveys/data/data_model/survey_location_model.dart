

import 'package:hive/hive.dart';
import 'package:zonka_feedback/services/hive/hive_type_id.dart';


@HiveType(typeId: HiveTypeId.surveyLocationTypeId)
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

// extension on SurveyLocationModel{
//   get  surveyLocationEntity => SurveyLocationEntity(
//     address: address,
//     locationId: locationId,
//     locationName: locationName,
//   );
  
// }