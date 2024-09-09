import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/services/network/network_exceptions.dart';
import 'package:zonka_feedback/setting/data/model/country_code_model.dart';

class CountryCodeDs {
  Future<ApiResult<List<CountryCodeModel>>> countryCodeDs() async {
    try {
      final String response = await rootBundle.loadString('assests/json/json_phone_code.json');

      final List<dynamic> data = json.decode(response) as List<dynamic>;

  // Map each item in the list to a CountryCodeModel
  List<CountryCodeModel> valueData = data.map((json) => CountryCodeModel.fromMap(json as Map<String, dynamic>)).toList();

  print("codedecode ${valueData.length}");
      return ApiResult.success(data:valueData);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
