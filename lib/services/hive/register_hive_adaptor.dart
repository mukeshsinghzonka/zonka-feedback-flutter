

import 'package:hive/hive.dart';
import 'package:zonka_feedback/login/data/data_model/login_response/login_response.dart';

Future<void> registerHiveAdaptor() async{
     Hive.registerAdapter(LoginResponseAdapter());
}