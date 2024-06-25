import 'package:zonka_feedback/location/data/data_model/location/location_model.dart';
import 'package:zonka_feedback/location/data/data_source/location_ds.dart';
import 'package:zonka_feedback/location/domain/repositories/location_repo.dart';
import 'package:zonka_feedback/services/network/api_result.dart';

class LocationRepoImpl extends LocationRepo {
  final LocationDataSource locationDataSource;

  LocationRepoImpl({required this.locationDataSource});

  @override
  Future<ApiResult<List<LocationModel>>> getLocationList() async {
      return await locationDataSource.getLocationListDs();
  }
}