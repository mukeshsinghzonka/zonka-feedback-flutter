import 'package:get/get.dart';
import 'package:zonka_feedback/location/presentation/manager/location_controller.dart';
import 'package:zonka_feedback/services/controller/base_controller.dart';
import 'package:zonka_feedback/services/get_it/get_it.dart';
import 'package:zonka_feedback/services/hive/hive_service.dart';
import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/surveys/data/data_model/survey_res_model.dart';
import 'package:zonka_feedback/surveys/data/data_model/survey_req_model.dart';
import 'package:zonka_feedback/surveys/domain/usecase/survey_uc.dart';
import 'package:zonka_feedback/utils/enum_util.dart';
import 'package:zonka_feedback/utils/hive_directory_util.dart';
import 'package:zonka_feedback/utils/hive_key.dart';

class SurveyController extends BaseControllerWithOutParams<void> {
 
  LocationController locationController =  Get.find<LocationController>();

  List<SurveyReqModel> _params = [];
  void _setParams(List<SurveyReqModel>? params) {
    _params = params ?? [];
    update();
  }


  List<SurveyResModel> _surveyList = [];
  List<SurveyResModel> get surveyList => _surveyList;
  void setSurveyList(List<SurveyResModel>? surveyList) {
    _surveyList = surveyList ?? [];
    update();
  }


  @override
  Future<void> call() async {
    setStatus(ApiCallStatus.Loading);
    await setParamsFromLocationController();
    ApiResult<List<SurveyResModel>> result = await getIt.get<SurveyUseCase>().call(_params);
    result.when(success: (data) async {
    setSurveyList(data);
    setStatus(ApiCallStatus.Success);
    return;
    }, failure: (error) async {
      setStatus(ApiCallStatus.Error);
      setNetworkExceptions(error);
    });
  }

  Future<void> setParamsFromLocationController() async {
    var data = await HiveService().getData(HiveDirectoryUtil.loginBox, HiveKey.loginUser);
    if (data != null) {
      _setParams(locationController.locationList
          .map((locationItem) => SurveyReqModel(
                branchId: locationItem.preMongifiedId,
                branchName: locationItem.name,
                brandId: locationItem.groupId,
                branchMongoId: locationItem.id,
                bgImage: locationItem.posterImage,
                companyId: data.companyPreMongifiedId,
                companyName: data.companyName,
              ))
          .toList());
    }
  }
}
 