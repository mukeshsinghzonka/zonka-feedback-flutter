import 'dart:io';
import 'dart:ui';

import 'package:battery_plus/battery_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:zonka_feedback/services/device_info/battery_info.dart';
import 'package:zonka_feedback/services/device_info/device_info.dart';
import 'package:zonka_feedback/services/device_info/location_info.dart';
import 'package:zonka_feedback/services/device_info/pakage_info.dart';

class DeviceDetailsModel {
  Map<String, dynamic> toJson() {
    AndroidDeviceInfo androidDeviceInfo = DeviceInfoService().androidInfo;
    FlutterView view = WidgetsBinding.instance.platformDispatcher.views.first;
    Size size = view.physicalSize;
    DateTime dateTime = DateTime.now();
    return {
      "uniqueId": androidDeviceInfo.id,
      "deviceName":androidDeviceInfo.product, 
      "deviceResolution": "${size.width} * ${size.height}",
      "longitude":LocationService().locationData.longitude,
      "latitude": LocationService().locationData.latitude,
      "deviceBatteryLevel": BatteryInfoService().batteryLevel,
      "deviceOS": "Android",
      "deviceTimeZone":dateTime.timeZoneName,
      "appVersion": PakageInfoService().packageInfo.version,
      "deviceCategory": "Mobile",
      "deviceBrand": "Samsung",
      "deviceSerialNumber":  androidDeviceInfo.serialNumber,
      "ipAddress": "192.168.1.1",
      "deviceLocation": "Delhi",
      "deviceIMEI": androidDeviceInfo.device,
      "deviceType": "Android",
      "appVersionCode": PakageInfoService().packageInfo.buildNumber,
      "deviceModel":  androidDeviceInfo.model,
      "charging": BatteryInfoService().batteryState == BatteryState.charging
          ? true
          : false,
      "deviceOSVersion":  Platform.operatingSystemVersion,
    };
  }
}
