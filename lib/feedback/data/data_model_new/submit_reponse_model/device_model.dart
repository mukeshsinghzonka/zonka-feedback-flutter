

import 'package:hive/hive.dart';
import 'package:zonka_feedback/services/hive/hive_type_id.dart';

part 'device_model.g.dart';

@HiveType(typeId: HiveTypeId.deviceModelId)
class DeviceModel extends HiveObject {
  @HiveField(0)
  final String? deviceOsVersion;
  @HiveField(1)
  final String? appVersion;
  @HiveField(2)
  final String? appVersionCode;
  @HiveField(3)
  final String? networkType;
  @HiveField(4)
  final String? syncType;
  @HiveField(5)
  final String? deviceBatteryLevel;

  DeviceModel(
      {required this.appVersion,
      required this.appVersionCode,
      required this.deviceBatteryLevel,
      required this.deviceOsVersion,
      required this.networkType,
      required this.syncType});

  Map<String, dynamic> toJsonDeviceModel() {
    return {
      'deviceOSVersion': deviceOsVersion,
      'appVersion': appVersion,
      'appVersionCode': appVersionCode,
      'networkType': networkType,
      'syncType': syncType,
      'deviceBatteryLevel': deviceBatteryLevel
    };
  }
}
