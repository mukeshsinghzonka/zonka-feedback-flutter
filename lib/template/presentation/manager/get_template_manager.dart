import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:zonka_feedback/services/controller/base_controller.dart';
import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/template/data/data_model/template_industries_map.dart';
import 'package:zonka_feedback/template/data/data_model/template_mapping_model.dart';
import 'package:zonka_feedback/template/data/data_model/template_model.dart';
import 'package:zonka_feedback/template/domain/usecase/get_template_uc.dart';
import 'package:zonka_feedback/utils/enum_util.dart';

import '../../../services/get_it/get_it.dart';

class GetTemplateManager extends BaseControllerWithOutParams<void> {
  late Rx<TemplateData> _templateData;
  Rx<TemplateData> get templateData => _templateData;
  void setTemplateSurvey(TemplateData data) {
    _templateData = data.obs;
    update();
  }

  RxMap filterTemplateIndustryMap = {}.obs;


  void _filterTemplateListModel() {
    List<TemplateModel> templateModelList =_templateData.value.templateModelList;
    List<TemplateIndustriesMap> templateIndustriesMap = _templateData.value.templateIndustriesMap;
    Map<String,List<TemplateModel?>> mapValue = {};
    for(int j = 0 ; j<templateIndustriesMap.length ; j++){
          mapValue[templateIndustriesMap[j].id??""] = [];
    }


      for (int i = 0; i < templateModelList.length; i++) {
    List<String> templateIndustries = templateModelList[i].templateIndustries ?? [];
    if (templateIndustries.isNotEmpty) {
      for (String industry in templateIndustries) {
        mapValue[industry]?.add(templateModelList[i]);
      }
    }
  }
      filterTemplateIndustryMap= mapValue.obs;
    update();
  }

  @override
  Future<void> call() async {
    setStatus(ApiCallStatus.Loading);
    ApiResult<TemplateData> response = await getIt.get<GetTemplateUc>().call();
    response.when(success: (data) async {
      setTemplateSurvey(data!);
      _filterTemplateListModel();
      setStatus(ApiCallStatus.Success);
      return;
    }, failure: (error) async {
      setStatus(ApiCallStatus.Error);
      setNetworkExceptions(error);
    });
  }
}
