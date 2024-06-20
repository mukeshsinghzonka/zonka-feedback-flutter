import 'package:get/get.dart';
import 'package:zonka_feedback/dashboard/presentation/manager/location_controller.dart';
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
  List<SurveyReqModel> get params => _params;
  void setParams(List<SurveyReqModel>? params) {
    _params = params ?? [];
    update();
  }

  @override
  Future<void> call() async {
    setStatus(ApiCallStatus.Loading);
    await setParamsFromLocationController();
    print("SurveyController: ${_params.length}");
    ApiResult<List<SurveyResModel>> result =
        await getIt.get<SurveyUseCase>().call(_params);
    result.when(success: (data) async {
      setStatus(ApiCallStatus.Success);

      return;
    }, failure: (error) async {
      setStatus(ApiCallStatus.Error);
      setNetworkExceptions(error);
    });
  }

  Future<void> setParamsFromLocationController() async {
    var data = await HiveService().getData(HiveDirectoryUtil.loginBox, HiveKey.loginUser);
    print("SurveyController: ${data}");
    if (data != null) {
      setParams(locationController.locationList
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
  //           BranchId: locationItem.pre_mongified_id.toString(),
  //           BranchMongoId: locationItem._id,
  //           BranchName: locationItem.name,
  //           BgImage: locationItem.posterImage ? locationItem.posterImage : "",
  //           BrandId: locationItem.groupId ? locationItem.groupId : "",
  //           BrandTitle: "Brand Name", // fixed
  //           IsDefaultBranch: "0", // fixed
  //           CompanyId: companyDetail.pre_mongified_id.toString(),
  //           CompanyName: companyDetail.name,