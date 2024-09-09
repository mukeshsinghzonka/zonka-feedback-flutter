import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:zonka_feedback/services/controller/base_controller.dart';
import 'package:zonka_feedback/services/get_it/get_it.dart';
import 'package:zonka_feedback/setting/data/model/country_code_model.dart';
import 'package:zonka_feedback/setting/domain/usecase/country_code_uc.dart';
import 'package:zonka_feedback/utils/enum_util.dart';

import '../../services/network/api_result.dart';

class CountryCodeController extends BaseControllerWithOutParams<void> {
  
  late final Rx<List<CountryCodeModel>> _countryCodeList = Rx<List<CountryCodeModel>>([]);
  Rx<List<CountryCodeModel>> get countryCodeList=> _countryCodeList;
  void setCountryCodeList(List<CountryCodeModel> countryCodeList) {
    _countryCodeList.value = countryCodeList;
    update(); // This is valid if you're using GetxController or GetBuilder
  }
 
 Rx<CountryCodeModel> _countryCodeModel = CountryCodeModel(
    countryName: '',
    dialCode: '',
    code: '',
  ).obs;
  Rx<CountryCodeModel> get countryCodeModel=>_countryCodeModel;
  void setCountryCodeModel(CountryCodeModel value){
    _countryCodeModel.value = value;
    update();
  }


  @override
  Future<void> call() async {
    setStatus(ApiCallStatus.Loading);
    ApiResult<List<CountryCodeModel>> result = await getIt.get<CountryCodeUc>().call();
    result.when(success: (data) async {
          print("countrycodelist ${data!.length}");
      setCountryCodeList(data);
      print("countrycodelist ${countryCodeList.value.length}");
      setStatus(ApiCallStatus.Success);
      return;
    }, failure: (error) async {
      setStatus(ApiCallStatus.Error);
      setNetworkExceptions(error);
    });
  }
}
