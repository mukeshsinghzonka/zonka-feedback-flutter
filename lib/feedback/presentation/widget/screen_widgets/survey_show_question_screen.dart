import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survery_api_feedback_controller.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_design_controller.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_next_screen_controller.dart';
import 'package:zonka_feedback/feedback/presentation/screens/widget/exit_widget.dart';
import 'package:zonka_feedback/feedback/presentation/screens/widget/screen_show_question_widget.dart';
import 'package:zonka_feedback/feedback/presentation/screens/widget/screen_switch_widget.dart';
import 'package:zonka_feedback/feedback/presentation/screens/widget/template_widget.dart';
import 'package:zonka_feedback/utils/enum_util.dart';
import 'package:zonka_feedback/utils/hexcolor_util.dart';

import '../../../../utils/global_value_notifier.dart';

class SurveyShowQuestionScreenWidget extends StatefulWidget {
  const SurveyShowQuestionScreenWidget({super.key});

  @override
  State<SurveyShowQuestionScreenWidget> createState() =>
      _SurveyShowQuestionScreenWidgetState();
}

class _SurveyShowQuestionScreenWidgetState
    extends State<SurveyShowQuestionScreenWidget> {
  final SurveyDesignFieldController surveyFieldController =
      Get.find<SurveyDesignFieldController>();
  final SurveyScreenManager surveyScreenManager =
      Get.find<SurveyScreenManager>();
  final SurveryApiFeedbackController surveryFeedbackApiController =
      Get.find<SurveryApiFeedbackController>();
  Timer? timer;

  @override
  void initState() {
    // surveyScreenManager.showDialogAfterDelay();
    super.initState();
  }

  // Future<void> asyncDurationValue() async {

  //   if(timer!=null){
  //       timer!.cancel();
  //   }
  //    timer  = Timer(const Duration(seconds: 30), () {
  //      surveyScreenManager.updateScreenTypeUtilFunction();
  //    });

  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              onError: (exception, stackTrace) {},
              fit: BoxFit.cover,
              image: NetworkImage(surveyFieldController.surveyBgImage.value)),
          color: HexColor(surveyFieldController.surveyBgColor.value),
        ),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  const Expanded(flex: 7, child: ScreenSwitchWidget()),
                  Visibility(
                    visible: isPreviewModeOn.value,
                    child: Container(
                      height: size.height / 10,
                      color: Colors.grey.shade400,
                      width: size.width,
                      alignment: Alignment.center,
                      child: Text(
                        'Survey Preview Mode',
                        style: TextStyle(fontSize: 10.sp),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 38,
                    child: Container(
                        // decoration: BoxDecoration(
                        //     border: Border.all(color: Colors.blueAccent)),
                        child: Obx(() {
                      return AnimatedSwitcher(
                          reverseDuration: const Duration(milliseconds: 1000),
                          switchInCurve: Curves.fastLinearToSlowEaseIn,
                          transitionBuilder: (child, animation) {
                            if (child.key is ValueKey<int>) {
                              final ValueKey<int> key =
                                  child.key as ValueKey<int>;
                              var fadeTransition =
                                  Tween<double>(begin: 0, end: 1)
                                      .animate(animation);
                              if (key.value !=
                                  surveyScreenManager.index.value) {
                                return FadeTransition(opacity: fadeTransition);
                              }

                              final Offset beginOffset = surveyScreenManager
                                          .screenTypeEnumUtil.value ==
                                      ScreenTypeEnumUtil.nextScreen
                                  ? const Offset(1.0, 0.0)
                                  : const Offset(-1.0, 0.0);

                              var offsetAnimation = Tween<Offset>(
                                begin: beginOffset,
                                end:
                                    const Offset(0.0, 0.0), // end at the center
                              ).animate(animation);
                              return SlideTransition(
                                position: offsetAnimation,
                                child: child,
                              );
                            } else {
                              // Handle cases where the key is not a ValueKey<int>
                              return child; // Or handle as needed
                            }
                          },
                          duration: const Duration(milliseconds: 1000),
                          child: GestureDetector(
                            key: ValueKey<int>(surveyScreenManager.index.value),
                            onHorizontalDragEnd: (DragEndDetails details) {
                              if (details.primaryVelocity! > 0) {
                                // User swiped Left
                                surveyScreenManager.previousScreen();
                              } else if (details.primaryVelocity! < 0) {
                                // User swiped Right
                                if (surveyScreenManager.nextScreenstop.value ==
                                    false) {
                                  surveyScreenManager.nextScreen();
                                }
                              }
                            },
                            child: SwitchScreenWidget(
                              feedbackQuestion: surveryFeedbackApiController
                                      .surveyDataModel
                                      .value
                                      .surveyModel!
                                      .surveyScreens?[
                                          surveyScreenManager.index.value]
                                      .fields ??
                                  [],
                              index: surveyScreenManager.index.value,
                            ),
                          ));
                    })),
                  ),
                ],
              ),
            ),
            Obx(() {
              if (surveyFieldController.screenBotton.value ==
                  SuveryScreenBottom.templateBottomBar) {
                return const TemplateBottomFeedback();
              }
              return const ExitWidget();
            })
          ],
        ));
  }
}
