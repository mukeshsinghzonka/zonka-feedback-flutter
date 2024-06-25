import 'package:zonka_feedback/location/data/data_model/location/location_model.dart';
import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/services/network/http_services.dart';
import 'package:zonka_feedback/services/network/network_exceptions.dart';

class LocationDataSource {
  final HttpUtil _httpUtil = HttpUtil();
  Future<ApiResult<List<LocationModel>>> getLocationListDs() async {
    try {
      List<LocationModel> locationListData = [];
      final response = await _httpUtil.get('/api/v1/locations/autosuggest?active=true');
      List locationList = response['data']['locationsMap'];
      for (int i = 0; i < locationList.length; i++) {
        locationListData.add(LocationModel.fromMap(locationList[i]));
      }
      print("loacationListData:${locationListData.length}");
      return ApiResult.success(data: locationListData);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
