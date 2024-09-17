import 'package:zonka_feedback/location/data/data_model/location/location_model.dart';
import 'package:zonka_feedback/location/domain/usecase/location_uc.dart';
import 'package:zonka_feedback/services/controller/base_controller.dart';
import 'package:zonka_feedback/services/get_it/get_it.dart';
import 'package:zonka_feedback/services/hive/hive_service.dart';
import 'package:zonka_feedback/services/network/api_result.dart';
import 'package:zonka_feedback/utils/enum_util.dart';
import 'package:zonka_feedback/utils/hive_directory_util.dart';
import 'package:zonka_feedback/utils/hive_key.dart';

class LocationController extends BaseControllerWithOutParams<void> {
  LocationModel? _selectedLocation;
  LocationModel? get selectedLocation => _selectedLocation;
  Future<void> setSelectedLocation(LocationModel? location) async {
    _selectedLocation = location;
    await HiveService().putData(HiveDirectoryUtil.locationBox, HiveKey.locationKey, location);
    update();
  }

  void setSelectedLocationFromHive() async {
   LocationModel value =  await HiveService().getData(HiveDirectoryUtil.locationBox, HiveKey.locationKey);
   _selectedLocation = value as LocationModel;      
    update();
  }


  List<LocationModel> _locationList = [];
  List<LocationModel> get locationList => _locationList;
  void setLocationList(List<LocationModel>? locationList) {
    _locationList = locationList ?? [];
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
