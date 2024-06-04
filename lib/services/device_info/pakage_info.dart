import 'package:package_info_plus/package_info_plus.dart';

class PakageInfoService {
  late PackageInfo _packageInfo;

  static final PakageInfoService _pakageInfoService = PakageInfoService._internal();
  PakageInfoService._internal();
  factory PakageInfoService() {
    return _pakageInfoService;
  }

  PackageInfo get packageInfo => _packageInfo;
  void init() async {
    _packageInfo = await PackageInfo.fromPlatform();
  }
}
