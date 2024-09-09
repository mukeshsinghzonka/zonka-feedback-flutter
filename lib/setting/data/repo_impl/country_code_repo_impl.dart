import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/setting/data/data_source/country_code_ds.dart';
import 'package:zonka_feedback/setting/data/model/country_code_model.dart';
import 'package:zonka_feedback/setting/domain/repo/country_code_repo.dart';

class CountryCodeRepoImpl extends CountryCodeRepo {

  final CountryCodeDs countryCodeDs;
  CountryCodeRepoImpl({ required this.countryCodeDs});
  @override
  Future<ApiResult<List<CountryCodeModel>>> getCountryCodeRepo() async {
   return await countryCodeDs.countryCodeDs();
  }
  
}