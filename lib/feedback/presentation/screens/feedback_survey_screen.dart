
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survery_api_feedback_controller.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_design_controller.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_next_screen_controller.dart';
import 'package:zonka_feedback/feedback/presentation/widget/screen_widgets/thank_you_widget.dart';
import 'package:zonka_feedback/feedback/presentation/widget/screen_widgets/welcome_screen.dart';


class SurveyScreen extends StatefulWidget {
  const SurveyScreen({super.key});
  @override
  State<SurveyScreen> createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  final SurveyScreenManager surveyScreenManager = Get.put(SurveyScreenManager());
  final SurveryApiFeedbackController surveryFeedbackController = Get.find<SurveryApiFeedbackController>();
  final SurveyDesignFieldController surveyFieldController = Get.put(SurveyDesignFieldController());
  
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
      return
      ThankYouWidget(field:surveryFeedbackController.surveyModel.value.thankyouPage );
      //   Container(       
      // decoration: BoxDecoration(
      // image: DecorationImage(
      //     onError: (exception, stackTrace) {},
      //     fit: BoxFit.cover,
      //     image: NetworkImage(surveyFieldController.surveyBgImage.value)),
      //     color: HexColor(surveyFieldController.surveyBgColor.value),
      // ),
      //   child: Column(
      //     children: [
      //     //   ResponsiveLayout(
      //     //     mobile: Expanded(flex: 1, child: ScreenSwitchWidget()),
      //     //     tablet: Expanded(flex: 7, child: ScreenSwitchWidget()),
      //     //     ),
      //     const Expanded(flex: 7, child: ScreenSwitchWidget()),
      //       Obx(() {
      //         return Expanded(
      //           flex: 29,
      //           child: AnimatedSwitcher(
      //             duration: const Duration(milliseconds: 500),
      //             child: Container(      
      //               decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
      //               child: SwitchScreenWidget(
      //                 feedbackQuestion: surveryFeedbackController.surveyModel.value.surveyScreens[surveyScreenManager.index.value] .fields,
      //                 index: surveyScreenManager.index.value,
      //               ),

      //             ),
      //           ),
      //         );
      //       }),
         
      //     const Expanded(flex: 3, child: ExitWidget())
      //     ],
      //   )
      // );
      
    });
  }
}
