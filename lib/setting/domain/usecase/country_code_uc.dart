import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/services/usecase/usecase.dart';
import 'package:zonka_feedback/setting/data/model/country_code_model.dart';
import 'package:zonka_feedback/setting/domain/repo/country_code_repo.dart';

class CountryCodeUc extends UseCaseNoParams<ApiResult<List<CountryCodeModel>>> {
  final CountryCodeRepo countryCodeRepo;
  CountryCodeUc({required this.countryCodeRepo});

  @override
  Future<ApiResult<List<CountryCodeModel>>> call() async {
      return await countryCodeRepo.getCountryCodeRepo();
  }
}
