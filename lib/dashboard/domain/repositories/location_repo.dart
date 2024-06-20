import 'package:zonka_feedback/dashboard/data/data_model/location_model.dart';
import 'package:zonka_feedback/services/network/api_result.dart';

abstract class LocationRepo {
  Future<ApiResult<List<LocationModel>>> getLocationList();
}