import 'package:equatable/equatable.dart';
import 'package:zonka_feedback/surveys/data/data_model/survey_location_model.dart';


class SurveyEntity extends Equatable{

  final String ? viewMode;
  final List<SurveyLocationModel>? surveyLocationList;
  final String ? workSpaceId;


  const SurveyEntity({
    this.viewMode,
    this.surveyLocationList,
    this.workSpaceId
  });

  @override
  List<Object?> get props => [viewMode, surveyLocationList, workSpaceId];
}