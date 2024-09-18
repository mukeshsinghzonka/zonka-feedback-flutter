import 'package:get/get.dart';

import 'package:zonka_feedback/services/controller/base_controller.dart';
import 'package:zonka_feedback/services/hive/hive_service.dart';
import 'package:zonka_feedback/utils/hive_directory_util.dart';
import 'package:zonka_feedback/utils/hive_key.dart';

import '../../../services/workmanager_functions/work_manager_service.dart';

class LogoutController extends BaseControllerWithOutParams<void> {


  @override
  Future<void> call() async {
    await _deleteData();
    await _clearBox();
    Get.deleteAll();
    WorkManagerService().cancelAllWorkManager();
  }



  Future<void> _deleteData() async {
    await HiveService().deleteData(HiveDirectoryUtil.locationBox, HiveKey.locationKey);
    await HiveService().deleteData(HiveDirectoryUtil.loginBox, HiveKey.loginUserKey);
  }

  Future<void> _clearBox() async {
    await HiveService().clearBox(HiveDirectoryUtil.loginBox);
    await HiveService().clearBox(HiveDirectoryUtil.locationBox);
  
  }
}
