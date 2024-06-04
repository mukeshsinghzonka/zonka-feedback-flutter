import 'dart:ui';

import 'package:battery_plus/battery_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:zonka_feedback/services/device_info/battery_info.dart';
import 'package:zonka_feedback/services/device_info/device_info.dart';
import 'package:zonka_feedback/services/device_info/location_info.dart';
import 'dart:io' show Platform;

import 'package:zonka_feedback/services/device_info/pakage_info.dart';

class SignInBodyModel {
  final String password;
  final String emailId;
  SignInBodyModel(
      {
      required this.password,
      required this.emailId,
   });

  Map<String, dynamic> toJsonAndroid() {
    AndroidDeviceInfo androidDeviceInfo = DeviceInfoService().androidInfo;
    FlutterView view = WidgetsBinding.instance.platformDispatcher.views.first;
    Size size = view.physicalSize;
    DateTime dateTime = DateTime.now();
    return {
      'LoginTime': dateTime,
      'Latitude': LocationService().locationData.latitude,
      'Longitude': LocationService().locationData.longitude,
      'IsRooted': 0,
      'AppVersion': PakageInfoService().packageInfo.version,
      'sitename': 'zonka',
      'DeviceSerialNumber': androidDeviceInfo.serialNumber,
      'DeviceCategory': androidDeviceInfo.board,
      'DeviceOSVersion': Platform.operatingSystemVersion,
      'Password': password,
      'DeviceModel': androidDeviceInfo.model,
      'UniqueId': androidDeviceInfo.id,
      'DeviceIMEI': androidDeviceInfo.device,
      'BatteryLevel':  BatteryInfoService().batteryLevel,
      'Keyword': 'Login2',
      'DeviceBrand': androidDeviceInfo.brand,
      'timeZone': dateTime.timeZoneName,
      'LocationOfDevice': '',
      'DeviceResolution': '${size.width} * ${size.height}',
      'DeviceOS': 'Android',
      'EmailAddress': emailId,
      'DeviceType': 'Android',
      'IsChargerPluggedIn': BatteryInfoService().batteryState == BatteryState.charging?1:0,
      'AppVersionCode': PakageInfoService().packageInfo.buildNumber,
      'FullName': '',
      'DeviceName': androidDeviceInfo.product,
      'IpAddress': '',
      'Resolution': '${size.width} * ${size.height}',
    };
  }
}
