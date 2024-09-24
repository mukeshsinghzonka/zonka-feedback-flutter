
import 'package:zonka_feedback/bottomnavigation/data/data_model/udpate_survey_res_model.dart';
import 'package:zonka_feedback/bottomnavigation/domain/usecase/update_survey_uc.dart';
import 'package:zonka_feedback/services/controller/base_controller.dart';
import 'package:zonka_feedback/services/get_it/get_it.dart';
import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/utils/enum_util.dart';

class UpdateSurveyController extends BaseControllerWithOutParams<void>{


  List<UpdateSurveyResModel> _updateSurveyModeList = [];
  List<UpdateSurveyResModel> get updateSurveyModeList => _updateSurveyModeList;
  void updateSurveyModelList(List<UpdateSurveyResModel> value){
     _updateSurveyModeList = value;
     update();
  }
  
  @override
  Future<void> call() async {
      setStatus(ApiCallStatus.Loading);
      ApiResult<List<UpdateSurveyResModel>> result = await getIt.get<UpdateSurveyUc>().call();
      result.when(success: (data) async {
      setStatus(ApiCallStatus.Success);
      updateSurveyModelList(data!);
      return;
    }, failure: (error) async {
      setStatus(ApiCallStatus.Error);
      setNetworkExceptions(error);
    });
  
  }

}