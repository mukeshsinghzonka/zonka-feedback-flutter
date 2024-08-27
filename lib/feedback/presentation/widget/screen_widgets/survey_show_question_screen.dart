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
import 'package:zonka_feedback/utils/enum_util.dart';
import 'package:zonka_feedback/utils/hexcolor_util.dart';

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
    surveyScreenManager.showDialogAfterDelay();
    super.initState();
  }

  Future<void> asyncDurationValue() async {

    if(timer!=null){
        timer!.cancel();
    }
     timer  = Timer(const Duration(seconds: 30), () {
       surveyScreenManager.updateScreenTypeUtilFunction();
     });
    
  }

  

  @override
  Widget build(BuildContext context) {
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
            const Expanded(flex: 7, child: ScreenSwitchWidget()),
            Expanded(
                flex: 29,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent)),
                  child: StreamBuilder<bool>(
                      stream:  surveyScreenManager.myStreamController?.stream,
                      builder: (context, snapshot) {
                        final value = snapshot.data;
            
                        if (snapshot.connectionState == ConnectionState.active && value != null && value == true && surveyFieldController.showInactiveAlert.value) {
                          // Once the future is complete, show the dialog
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return FutureBuilder(
                                    future: asyncDurationValue(),
                                    builder: (context, builder) {
                                      return AlertDialog(
                                        shape: const RoundedRectangleBorder( borderRadius: BorderRadius.all( Radius.circular(10.0))),
                                        actionsOverflowAlignment:
                                            OverflowBarAlignment.center,
                                        actionsAlignment:
                                            MainAxisAlignment.center,
                                        content: Text(
                                          "You have been idle for some time. Do you wish to \n continue ?",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 8.sp),
                                        ),
                                        actions: <Widget>[
                                          TextButton(
                                            child: const Text("NO"),
                                            onPressed: () {
                                              surveyScreenManager.updateScreenTypeUtilFunction();
                                           if(timer!= null)   timer!.cancel();
                                              Navigator.of(context).pop();

                                            },
                                          ),
                                          SizedBox(
                                            width: 50.w,
                                          ),
                                          TextButton(
                                            child: const Text("YES"),
                                            onPressed: () {
                                           if(timer!= null)  timer!.cancel();
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                        ],
                                      );
                                    });
                              },
                            );
                          });
                        }
                        return Obx(() {
                          return AnimatedSwitcher(
                              reverseDuration:
                                  const Duration(milliseconds: 1000),
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
                                    return FadeTransition(
                                        opacity: fadeTransition);
                                  }

                                  final Offset beginOffset = surveyScreenManager
                                              .screenTypeEnumUtil.value ==
                                          ScreenTypeEnumUtil.nextScreen
                                      ? const Offset(1.0, 0.0)
                                      : const Offset(-1.0, 0.0);

                                  var offsetAnimation = Tween<Offset>(
                                    begin: beginOffset,
                                    end: const Offset(
                                        0.0, 0.0), // end at the center
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
                                    if (surveyScreenManager.nextScreenstop.value == false) {
                                      surveyScreenManager.nextScreen();
                                    }
                                  }
                                },
                                child: SwitchScreenWidget(
                                  feedbackQuestion: surveryFeedbackApiController
                                      .surveyModel
                                      .value
                                      .surveyScreens[
                                          surveyScreenManager.index.value]
                                      .fields,
                                  index: surveyScreenManager.index.value,
                                ),
                              ));
                        });
                      }),
                )),
            const ExitWidget()
          ],
        ));
  }
}
