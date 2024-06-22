
import 'package:zonka_feedback/location/data/data_model/location_model.dart';
import 'package:zonka_feedback/location/domain/repositories/location_repo.dart';
import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/services/usecase/usecase.dart';

class LocationUc extends UseCaseNoParams<ApiResult<void>> {
  final LocationRepo locationRepo;
  LocationUc({required this.locationRepo});

  @override
  Future<ApiResult<List<LocationModel>>> call() async {
    return await locationRepo.getLocationList();
  }
}