

import 'package:hive_flutter/adapters.dart';
import 'package:zonka_feedback/services/hive/hive_type_id.dart';
part 'survey_count_response.g.dart';

@HiveType(typeId: HiveTypeId.surveyCountReponseId)
class SurveyCountResponseData extends HiveObject {
   
   @HiveField(0)
   int count;
   @HiveField(1)
   DateTime dateTime;

  SurveyCountResponseData({
    required this.count,
    required this.dateTime,
  });


  // To store and retrieve this object from Hive, we need to convert it to a map
  Map<String, dynamic> toMap() {
    return {
      'count': count,
      'dateTime': dateTime,
    };
  }

  // To reconstruct the object from the map
  factory SurveyCountResponseData.fromMap(Map<String, dynamic> map) {
    return SurveyCountResponseData(
      count: map['count'] ?? 0,
      dateTime: DateTime.parse(map['dateTime']),
    );
  }
}

