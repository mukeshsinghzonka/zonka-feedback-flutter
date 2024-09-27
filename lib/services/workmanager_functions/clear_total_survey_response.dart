

import '../../utils/hive_directory_util.dart';
import '../get_it/get_it.dart';
import '../hive/hive_service.dart';

Future<void> clearTotalSurveyResponse() async {
  await HiveService().init();
  setup();

  try{
    var box  = await  HiveService().openBox(HiveDirectoryUtil.totalSurveyResponseCount);
    List<dynamic> keys = box!.keys.toList();
    for(var key in keys){
      HiveService().putData(HiveDirectoryUtil.totalSurveyResponseCount, key , 0);
    }
  }
  catch(e){
    print("Error clear processing survey");
  }

}