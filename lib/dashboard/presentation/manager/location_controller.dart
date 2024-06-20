import 'package:zonka_feedback/dashboard/data/data_model/location_model.dart';
import 'package:zonka_feedback/dashboard/domain/usecase/location_uc.dart';
import 'package:zonka_feedback/services/controller/base_controller.dart';
import 'package:zonka_feedback/services/get_it/get_it.dart';
import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/utils/enum_util.dart';

class LocationController extends BaseControllerWithOutParams<void> {

  List<LocationModel> _locationList = [];
  List<LocationModel> get locationList => _locationList;
  void setLocationList(List<LocationModel> ?locationList) {
    _locationList = locationList??[];
     update();
  }

  @override
  Future<void> call() async {
    setStatus(ApiCallStatus.Loading);
    ApiResult<List<LocationModel>> result = await getIt.get<LocationUc>().call();
    result.when(success: (data) async {
      setStatus(ApiCallStatus.Success);
      setLocationList(data);
      return;
    }, failure: (error) async {
      setStatus(ApiCallStatus.Error);
      setNetworkExceptions(error);
    });
  }
}
