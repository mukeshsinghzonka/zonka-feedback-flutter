import 'package:get/get.dart';
import 'package:zonka_feedback/dashboard/presentation/manager/workspace_controller.dart';
import 'package:zonka_feedback/location/presentation/manager/location_controller.dart';
import 'package:zonka_feedback/services/hive/hive_service.dart';
import 'package:zonka_feedback/surveys/data/data_model/survey_res_model.dart';
import 'package:zonka_feedback/surveys/presentation/manager/survey_controller.dart';
import 'package:zonka_feedback/utils/hive_directory_util.dart';
import 'package:zonka_feedback/utils/hive_key.dart';

class SurveyManagerController extends GetxController {
  final WorkspaceController _workspaceController =
      Get.find<WorkspaceController>();
  final SurveyController _surveyController = Get.find<SurveyController>();
  final LocationController _locationController = Get.find<LocationController>();
  List<SurveyResModel> _filteredSurveyList = [];
  List<SurveyResModel> get filteredSurveyList => _filteredSurveyList;
  void setFilteredSurveyList(List<SurveyResModel>? surveyList) {
    _filteredSurveyList = surveyList ?? [];
    update();
  }

  void filterSurveyList(String? searchText) {
    if (searchText == null || searchText.isEmpty) {
      setFilteredSurveyList(_surveyController.surveyList);
      return;
    }
    setFilteredSurveyList(_surveyController.surveyList
        .where((element) =>
            element.surveyName.toLowerCase().contains(searchText.toLowerCase()))
        .toList());
  }

  Future<void> getSurveyListWorkspace() async {
    var locationData = await HiveService()
        .getData(HiveDirectoryUtil.locationBox, HiveKey.location);
    if (locationData != null) {
      List<SurveyResModel> tempList = [];
      List<SurveyResModel> surveyWorkspaceFiltered = _surveyController.surveyList.where((element) =>
              element.workSpaceId ==
              _workspaceController.selectedWorkspace?.workSpaceId)
          .toList();
      for (var element in surveyWorkspaceFiltered) {
        if (element.surveyLocationList.isEmpty) {
          tempList.add(element);
        } else {
          element.surveyLocationList.map((location) {
            if (location.locationId ==
                _locationController.selectedLocation?.id) {
              tempList.add(element);
            }
          });
        }
      }
      setFilteredSurveyList(tempList);
    } else {
      setFilteredSurveyList(_surveyController.surveyList.where((element) =>
              element.workSpaceId ==
              _workspaceController.selectedWorkspace?.workSpaceId)
          .toList());
    }
  }
}
