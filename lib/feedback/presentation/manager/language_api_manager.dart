import 'package:get/get.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/language_model.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/language_page_model.dart';
import 'package:zonka_feedback/feedback/domain/usecase/selected_language_uc.dart';
import 'package:zonka_feedback/services/controller/base_controller.dart';
import 'package:zonka_feedback/services/get_it/get_it.dart';
import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/utils/enum_util.dart';

class LanguageManagerController extends BaseControllerWithOutParams<void>{

  
  List<LanguageModel> _languageModel = [];
  List<LanguageModel> get languageModel => _languageModel;
  void setUpdateLanguage(List<LanguageModel> value ){
    _languageModel = value;
    update();
  }
  
RxList<dynamic> filterlanguageModel = [].obs;

void filterLanguageSelected(Map<String, LanguagePageTranslation>? translations) {
  if (translations == null) return;
  for (var key in translations.keys) {
    var filteredList = languageModel.where((e) => e.languageCode == key).toList();
    if (filteredList.isNotEmpty) {
      filterlanguageModel.add(filteredList.first);
    }
  }
  filterlanguageModel.value = languageModel;
  update();
}
  @override
  Future<void> call() async {
   setStatus(ApiCallStatus.Loading);
    ApiResult<List<LanguageModel>> response = await getIt.get<SelectedLanguageUc>().call();
      response.when(success: (data)  {
      setStatus(ApiCallStatus.Success);
      setUpdateLanguage(data??[]);
      return;
    }, failure: (error) async {
      setStatus(ApiCallStatus.Error);
      setNetworkExceptions(error);
    });
  }

}