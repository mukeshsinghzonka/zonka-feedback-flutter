import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:zonka_feedback/services/workmanager_functions/work_manager_service.dart';

class NetworkConnectivity {
  static final NetworkConnectivity _instance = NetworkConnectivity.internal();
  NetworkConnectivity.internal();
  factory NetworkConnectivity() => _instance;

  late StreamSubscription<InternetStatus> _listener;
  final ValueNotifier<InternetStatus> connectionStatus =
      ValueNotifier<InternetStatus>(InternetStatus.disconnected);

  Future<void> initNetworConnection() async {
    InternetConnection.createInstance(
      customCheckOptions: [
        InternetCheckOption(uri: Uri.parse('https://example.com')),
      ],
    );
  }

  Future<bool> isConnected() async {
    return await InternetConnection().hasInternetAccess;
  }

  void startListening() {
    _listener = InternetConnection().onStatusChange.listen((InternetStatus status) {
      
      switch (status) {
        case InternetStatus.connected:
          connectionStatus.value = InternetStatus.connected;
          WorkManagerService().startWorkManager();
          break;
        case InternetStatus.disconnected:
          connectionStatus.value = InternetStatus.disconnected;
          break;
      }
    });
  }

  void disposeListening() {
    _listener.cancel();
  }
}
