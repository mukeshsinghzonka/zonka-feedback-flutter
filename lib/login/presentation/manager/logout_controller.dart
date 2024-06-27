import 'package:get/get.dart';
import 'package:zonka_feedback/location/presentation/manager/search_location_controller.dart';
import 'package:zonka_feedback/services/controller/base_controller.dart';
import 'package:zonka_feedback/services/hive/hive_service.dart';
import 'package:zonka_feedback/utils/hive_directory_util.dart';
import 'package:zonka_feedback/utils/hive_key.dart';

class LogoutController extends BaseControllerWithOutParams<void> {

  final SearchLocationController _searchLocationController = SearchLocationController();

  @override
  Future<void> call() async {
    await _deleteData();
    await _clearBox();
    Get.deleteAll(); 
    // _clearList();
  }

  // void _clearList(){
  //   _searchLocationController.filteredLocationList.clear();
  // }

  Future<void> _deleteData() async {
    await HiveService().deleteData(HiveDirectoryUtil.locationBox, HiveKey.location);
    await HiveService().deleteData(HiveDirectoryUtil.loginBox, HiveKey.loginUser);
  }

  Future<void> _clearBox() async {
    await HiveService().clearBox(HiveDirectoryUtil.loginBox);
    await HiveService().clearBox(HiveDirectoryUtil.locationBox);
  }
}
