import 'package:zonka_feedback/services/hive/hive_service.dart';
import 'package:zonka_feedback/utils/hive_directory_util.dart';

Future<void> openHiveBox() async {
   await HiveService().openBox(HiveDirectoryUtil.loginBox);
   await HiveService().openBox(HiveDirectoryUtil.locationBox);
}