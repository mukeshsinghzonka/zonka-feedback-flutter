import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survery_api_feedback_controller.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_design_controller.dart';
import 'package:zonka_feedback/feedback/presentation/screens/feedback_survey_screen.dart';
import 'package:zonka_feedback/utils/enum_util.dart';

class SettingUpscreen extends StatefulWidget {
  final SuveryScreenBottom screenBottom;
  final String? surveyId;
  const SettingUpscreen({super.key, required this.screenBottom, required this.surveyId});

  @override
  State<SettingUpscreen> createState() => _SettingUpScreenState();
}

class _SettingUpScreenState extends State<SettingUpscreen> {

  final SurveryApiFeedbackController surveryFeedbackController = Get.put(SurveryApiFeedbackController());
  final SurveyDesignFieldController surveyFieldController = Get.put(SurveyDesignFieldController());

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
    initializeValue();
    super.initState();
  }



  Future<void> initializeValue() async {
    await surveryFeedbackController.call(widget.surveyId ?? "");
    if (surveryFeedbackController.apiStatus.value == ApiCallStatus.Error) {
      Navigator.of(context).pop();
    }
    surveyFieldController.setStartDateTimeValue(DateTime.now());
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: OrientationBuilder(builder: (context, builder) {
      return Obx(() {
        if (surveryFeedbackController.apiStatus.value == ApiCallStatus.Success) {
          return SurveyScreenFeedbackPage(
            screenBottom: widget.screenBottom,
            key: ValueKey(widget.surveyId),
          );
        }
        return Container(
          alignment: Alignment.center,
          child: const Text("Setting up"),
        );
      });
    }));
  }
}
