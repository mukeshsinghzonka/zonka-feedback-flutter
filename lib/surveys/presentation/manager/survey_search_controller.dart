
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:zonka_feedback/surveys/data/data_model/survey_res_model.dart';
import 'package:zonka_feedback/surveys/presentation/manager/survey_manage_controller.dart';

class SurveySearchController extends GetxController{

  final SurveyManagerController _surveyManagerController = Get.find<SurveyManagerController>();

  final TextEditingController _searchSurveyController = TextEditingController();
  TextEditingController get searchSurveyController => _searchSurveyController;
  
  
  List<SurveyResModel> _filteredSurveySearchList = [];
  List<SurveyResModel> get filteredSurveySearchList => _filteredSurveySearchList;
  void setfilteredSurveySearchList(List<SurveyResModel> ?surveyList) {
    _filteredSurveySearchList = surveyList ?? [];
    update();
  }

 void filterSurveySearchList() async {
    if (searchSurveyController.text.isEmpty) {
      setfilteredSurveySearchList([]);
      return;
    }

    setfilteredSurveySearchList( _surveyManagerController.filteredSurveyList.where((e) => e.surveyName.toLowerCase().contains(searchSurveyController.text.toLowerCase())).toList());
  }

}