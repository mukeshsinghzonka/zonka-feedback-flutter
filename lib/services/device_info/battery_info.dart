import 'dart:async';

import 'package:battery_plus/battery_plus.dart';

class BatteryInfoService {
  late var _battery;
  late BatteryState _batteryState;
  late int batteryLevel;
  StreamSubscription<BatteryState>? _batteryStateSubscription;

  static final BatteryInfoService _batteryInfoService = BatteryInfoService._internal();
  BatteryInfoService._internal();
  BatteryState get batteryState => _batteryState;
  int get getBatteryLevel => batteryLevel;

  factory BatteryInfoService() {
    return _batteryInfoService;
  }

  void init() {
    _battery = Battery();
    updateBatteryStateFunction();
    updateBatteryLevel();
  }

  void updateBatteryStateFunction() {
    _battery.batteryState.then(_updateBatteryState);
    _batteryStateSubscription = _battery.onBatteryStateChanged.listen(_updateBatteryState);
  }

  void updateBatteryLevel() {
    _battery.batteryLevel.then((value) {
      batteryLevel = value;
    });
  }

  void _updateBatteryState(BatteryState state) {
    _batteryState = state;
  }

  void dispose() {
    if (_batteryStateSubscription != null) {
      _batteryStateSubscription!.cancel();
    }
  }
}
