class DeviceModel {
  final String? deviceOsVersion;
  final String? appVersion;
  final String? appVersionCode;
  final String? networkType;
  final String? syncType;
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
