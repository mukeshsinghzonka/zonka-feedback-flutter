import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survery_api_feedback_controller.dart';
import 'package:zonka_feedback/feedback/presentation/screens/feedback_survey_screen.dart';
import 'package:zonka_feedback/utils/enum_util.dart';

class SettingUpscreen extends StatefulWidget {
  final SuveryScreenBottom screenBottom;
  final String? surveyId;
  const SettingUpscreen(
      {super.key, required this.screenBottom, required this.surveyId});

  @override
  State<SettingUpscreen> createState() => _SettingUPScreenState();
}

class _SettingUPScreenState extends State<SettingUpscreen> {
  final SurveryApiFeedbackController surveryFeedbackController =  Get.put(SurveryApiFeedbackController());

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
surveryFeedbackController.call(widget.surveyId ?? "");
    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(builder: (context, builder) {
        
        return Obx(
           () {
            if(surveryFeedbackController.apiStatus.value == ApiCallStatus.Success){
return  SurveyScreenFeedbackPage(screenBottom: widget.screenBottom,);
            }
            return Container(
                    alignment: Alignment.center,
                    child: Text("Setting up"),
                  );
          }
        );
      })
    );
  }
}
