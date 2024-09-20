

import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/services/network/network_connectivity.dart';
import 'package:zonka_feedback/template/data/data_model/template_mapping_model.dart';
import 'package:zonka_feedback/template/data/data_source/local_ds/get_local_template_ds.dart';
import 'package:zonka_feedback/template/data/data_source/network_ds/get_template_ds.dart';
import 'package:zonka_feedback/template/domain/repositories/get_template_repo.dart';

class GetAllTemplateRepoImpl extends GetAllTemplateRepo{
  final GetLocalTemplateDs getLocalTemplateDs;
  final GetAllTemplateDs getAllTemplateDs;
  NetworkConnectivity networkConnectivity = NetworkConnectivity();
  GetAllTemplateRepoImpl({required this.getAllTemplateDs, required this.getLocalTemplateDs});

  @override
  Future<ApiResult<TemplateData>> getAllSurveyTemplates() async { 
    bool checkConnectivity = await networkConnectivity.isConnected();
    if(checkConnectivity){
      return await getAllTemplateDs.getAllTemplateDs();
    }
    else{
      return await getLocalTemplateDs.getAllLocalTemplateDs();
    }
   
  }

}