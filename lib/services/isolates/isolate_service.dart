import 'dart:convert';
import 'dart:isolate';
import 'dart:ui';
import 'package:zonka_feedback/services/hive/hive_service.dart';
import '../../utils/hive_directory_util.dart';
import '../../utils/hive_key.dart';
import '../workmanager_functions/sync_survey_send_port_model.dart';


class IsolateService {
  final String portName;
  IsolateService({required this.portName});
  final receivePort = ReceivePort();


  void initPortWithName() {
    IsolateNameServer.registerPortWithName(
      receivePort.sendPort,
      portName,
    );
    _listenToPort();
  }

  void _listenToPort() {
    receivePort.listen((data) async {
      // Update your UI data, for example:
   switch (portName){
     case 'isolate_port1':
       if(data!=null){
         final dataVal =  jsonDecode(data);
         SyncSurveyPortModel surveyPortModel = SyncSurveyPortModel.fromJson(dataVal);
         await HiveService().putData(HiveDirectoryUtil.surveyLastSyncDateTime,surveyPortModel.surveyId,surveyPortModel.dateTime);
         dynamic count = await HiveService().getData(HiveDirectoryUtil.surveyUnsyncResponseCount, surveyPortModel.surveyId??"");
         await HiveService().putData(HiveDirectoryUtil.surveyUnsyncResponseCount, surveyPortModel.surveyId??"",count == null? 0:count < 0 ? 0 : count - 1);
       }
       break;
     case 'isolate_port2':
       if(data!=null){
        await HiveService().putData(HiveDirectoryUtil.surveyLastUpdateDateTime, HiveKey.surveyLastUpdateKey, DateTime.parse(data));
       }
       break;

   }

    });

  }
}
