import 'package:zonka_feedback/location/data/data_model/location/location_model.dart';
import 'package:zonka_feedback/services/network/api_result.dart';

abstract class LocationRepo {
  Future<ApiResult<List<LocationModel>>> getLocationList();
}