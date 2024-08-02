import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survery_api_feedback_controller.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_design_controller.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_next_screen_controller.dart';
import 'package:zonka_feedback/feedback/presentation/screens/widget/exit_widget.dart';
import 'package:zonka_feedback/feedback/presentation/screens/widget/screen_switch_widget.dart';
import 'package:zonka_feedback/feedback/presentation/screens/widget/screen_show_question_widget.dart';
import 'package:zonka_feedback/utils/hexcolor_util.dart';

class SurveyScreen extends StatefulWidget {
  const SurveyScreen({super.key});
  @override
  State<SurveyScreen> createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  final SurveyScreenManager surveyScreenManager =
      Get.put(SurveyScreenManager());
  final SurveryApiFeedbackController surveryFeedbackController =
      Get.find<SurveryApiFeedbackController>();
  final SurveyDesignFieldController surveyFieldController =
      Get.put(SurveyDesignFieldController());
  @override
  void initState() {
    surveyFieldController.setFieldFromSurveyModel();
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
            image: DecorationImage(
                onError: (exception, stackTrace) {},
                fit: BoxFit.cover,
                image: NetworkImage(surveyFieldController.surveyBgImage.value)),
            color: HexColor(surveyFieldController.surveyBgColor.value),
            border: Border.all(color: Colors.blueAccent)),
        child: SafeArea(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10.w),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Expanded(flex: 3, child: ScreenSwitchWidget()),
                Obx(() {
                  return Expanded(
                    flex: 29,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent)),
                      child: SwitchScreenWidget(
                        feedbackQuestion: surveryFeedbackController
                            .surveyModel
                            .value
                            .surveyScreens[surveyScreenManager.index.value]
                            .fields,
                      ),
                    ),
                  );
                }),
             
              const Expanded(flex: 3, child: ExitWidget())
              ],
            ),
          ),
        ),
      );
    });
  }
}
