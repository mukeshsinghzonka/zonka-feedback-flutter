import 'dart:isolate';
import 'dart:ui';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:zonka_feedback/surveys/presentation/manager/survey_time_unsync_controller.dart';


class IsolateService {
  final String portName;
  IsolateService({required this.portName});
  final receivePort = ReceivePort();
  SurveyTimeUnsyncController surveyTimeUnsyncController =  Get.put(SurveyTimeUnsyncController());


  void initPortWithName() {
    IsolateNameServer.registerPortWithName(
      receivePort.sendPort,
      portName,
    );
    _listenToPort();
  }

  void _listenToPort() {
    receivePort.listen((data) {
      // Update your UI data, for example:
      print("surveydatarecived $data");
    
      surveyTimeUnsyncController.setSurveyLastSync("fjbef",DateTime.now());
      // SendPort? mainThreadPort = IsolateNameServer.lookupPortByName('mainThreadPort');
      // if (mainThreadPort != null) {
      //   mainThreadPort.send('hive_updated');
      // }
    });

  }
}
