import 'dart:convert';
import 'dart:isolate';
import 'dart:ui';
import 'package:zonka_feedback/services/hive/hive_service.dart';
import '../../utils/hive_directory_util.dart';
import '../../utils/hive_key.dart';
import '../workmanager_functions/workmanager_model/sync_survey_send_port_model.dart';
import '../workmanager_functions/workmanager_model/update_survey_model.dart';


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
         UpdateSurveyModelValue updateSurveyModelValue = UpdateSurveyModelValue.fromJson(jsonDecode(data));
         await HiveService().putData(HiveDirectoryUtil.surveyLastUpdateDateTime, HiveKey.surveyLastUpdateKey, updateSurveyModelValue);

        for(int i = 0;i<updateSurveyModelValue.surveyId!.length;i++){
           await HiveService().putData(HiveDirectoryUtil.updateHiveSurveyId,updateSurveyModelValue.surveyId![i]??"",updateSurveyModelValue.surveyUpdateDateTime.toUtc());
        }

       }
       break;

   }

    });

  }
}
