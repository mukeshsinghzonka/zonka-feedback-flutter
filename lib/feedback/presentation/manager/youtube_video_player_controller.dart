import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/field_model.dart';

class VideoPlayerControllerManager extends GetxController  {


  RxMap<String, YoutubePlayerController> surveyVideoFieldData = <String, YoutubePlayerController>{}.obs;

  void updateVideoSurveyData({required String fieldId, required YoutubePlayerController value}){
    surveyVideoFieldData[fieldId] = value;
    update();
  }
  
  void initalizeVideoSurveyData({required Field fields }){

  
   if(fields.videoEmbedScript!=null && fields.videoEmbedScript!=""){
    surveyVideoFieldData[fields.id ?? ""] = YoutubePlayerController(
    initialVideoId: YoutubePlayer.convertUrlToId(fields.videoEmbedScript!)!,
    flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
   }
      
    
    update();
  }


}