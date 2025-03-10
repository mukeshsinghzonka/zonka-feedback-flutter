import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:zonka_feedback/myapp_screen.dart';
import 'package:zonka_feedback/services/device_info/battery_info.dart';
import 'package:zonka_feedback/services/device_info/device_info.dart';
import 'package:zonka_feedback/services/device_info/location_info.dart';
import 'package:zonka_feedback/services/device_info/pakage_info.dart';
import 'package:zonka_feedback/services/hive/hive_service.dart';
import 'package:zonka_feedback/services/network/network_connectivity.dart';
import 'package:zonka_feedback/services/workmanager_functions/work_manager_service.dart';
import 'package:zonka_feedback/utils/enum_util.dart';
import 'package:zonka_feedback/services/get_it/get_it.dart';
import 'package:zonka_feedback/services/network/http_services.dart';
import 'package:zonka_feedback/services/sharedprefrence_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MySharedPreferences().init();
  DeviceInfoService().init();
  BatteryInfoService().init();
  LocationService().init();
  PakageInfoService().init();
  FlutterSmartDialog.init();
  await HiveService().init();
  await NetworkConnectivity().initNetworConnection();
  NetworkConnectivity().startListening();
  WorkManagerService().initWorkManager();
  HttpUtil().initServerType(ServerType.NIGHTLY);
  setup();
  runApp(const MyApp());
}
