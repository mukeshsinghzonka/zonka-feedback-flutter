import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

class DeviceInfoService {
  late DeviceInfoPlugin _deviceInfoPlugin;
  late AndroidDeviceInfo _androidInfo;
  late IosDeviceInfo _iosInfo;

  IosDeviceInfo get iosInfo => _iosInfo;
  AndroidDeviceInfo get androidInfo => _androidInfo;
  static final DeviceInfoService _deviceInfoService = DeviceInfoService._internal();
  DeviceInfoService._internal();

  factory DeviceInfoService() {
    return _deviceInfoService;
  }

  void init() {
    _deviceInfoPlugin = DeviceInfoPlugin();
    getDeviceId();
  }

  Future<void> getDeviceId() async {
    if (Platform.isAndroid) {
      _androidInfo = await _deviceInfoPlugin.androidInfo;
      _printDeviceInformation();
    } else if (Platform.isIOS) {
      _iosInfo = await _deviceInfoPlugin.iosInfo;
    } else {
      throw Exception('Unsupported platform');
    }
  }

  void _printDeviceInformation(){
    print('Device Info: ');
    print('Device: ${androidInfo.model}');
    print('OS: ${androidInfo.version.release}');
    print('Device ID: ${androidInfo.device}');
    print('Device Brand: ${androidInfo.brand}');
    print('Device Name: ${androidInfo.product}');
    print('Device Type: ${androidInfo.type}');
    print('Device Serial Number: ${androidInfo.serialNumber}');
    print('Device Category: ${androidInfo.board}');
    print('Device Manufacturer: ${androidInfo.manufacturer}');
    print('Device Host: ${androidInfo.host}');
    print('Device ID: ${androidInfo.id}');
    print('Device Display: ${androidInfo.display}');
    print('Device Fingerprint: ${androidInfo.fingerprint}');
    print('Device Hardware: ${androidInfo.hardware}');
    print('Device Tags: ${androidInfo.tags}');
    print('Device Supported 32 Bit ABIs: ${androidInfo.supported32BitAbis}');
    print('Device Supported 64 Bit ABIs: ${androidInfo.supported64BitAbis}');
    print('Device Supported ABIs: ${androidInfo.supportedAbis}');
    print('Device System Features: ${androidInfo.systemFeatures}');
    print('Device is Physical: ${androidInfo.isPhysicalDevice}');
    print('Device is Low Ram: ${androidInfo.isLowRamDevice}');




  }
}
