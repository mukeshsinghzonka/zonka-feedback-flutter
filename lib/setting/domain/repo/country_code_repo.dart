

import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/setting/data/model/country_code_model.dart';

abstract class CountryCodeRepo {
  Future<ApiResult<List<CountryCodeModel>>> getCountryCodeRepo();
}