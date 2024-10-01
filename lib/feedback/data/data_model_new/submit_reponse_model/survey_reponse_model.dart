
import 'package:hive/hive.dart';
import 'package:zonka_feedback/services/hive/hive_type_id.dart';


part 'survey_reponse_model.g.dart';

@HiveType(typeId: HiveTypeId.surveyResponse)
class SurveyResponse  extends HiveObject {
  @HiveField(0)
  final String? fieldId;
  @HiveField(1)
  final String ?fieldValue;
  @HiveField(2)
  final String ?choiceId;
  @HiveField(3)
  final String ?optionId;
  @HiveField(4)
  final String ? takenBy;

  @HiveField(5)
  final String ? fieldName;

  SurveyResponse({
     this.fieldId,
     this.fieldValue,
     this.choiceId,
     this.optionId,
     this.takenBy,
     this.fieldName
  });

  Map<String, dynamic> toJsonSurveyReponse() {
    return {
      "fieldId": fieldId??"",
      "fieldValue": fieldValue??"",
      "choiceId": choiceId??"",
      "optionId": optionId??"",
      "takenBy":takenBy??"",
      "filedName":fieldName??""
    };
  }
}
