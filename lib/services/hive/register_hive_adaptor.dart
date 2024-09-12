

import 'package:hive/hive.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/submit_reponse_model/customer_model.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/submit_reponse_model/device_model.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/submit_reponse_model/survey_reponse_model.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/submit_reponse_model/survey_submit_model.dart';
import 'package:zonka_feedback/location/data/data_model/location/location_model.dart';
import 'package:zonka_feedback/login/data/data_model/login_response/login_response.dart';


Future<void> registerHiveAdaptor() async {
     Hive.registerAdapter(LoginResponseAdapter());
     Hive.registerAdapter(LocationModelAdapter());
     Hive.registerAdapter(SurveySubmitModelAdapter());
     Hive.registerAdapter(SurveyResponseAdapter());
     Hive.registerAdapter(DeviceModelAdapter());
     Hive.registerAdapter(CustomerAdapter());

     
}