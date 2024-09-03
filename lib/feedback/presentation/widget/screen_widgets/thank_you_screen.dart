import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/submit_reponse_model/survey_reponse_model.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/submit_reponse_model/survey_submit_model.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/thankyou_model.dart';
import 'package:zonka_feedback/feedback/presentation/manager/submit_survey_manager.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survery_api_feedback_controller.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_collect_data_controller.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_design_controller.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_next_screen_controller.dart';
import 'package:zonka_feedback/feedback/presentation/screens/widget/exit_widget.dart';
import 'package:zonka_feedback/feedback/presentation/screens/widget/template_widget.dart';
import 'package:zonka_feedback/utils/enum_util.dart';
import 'package:zonka_feedback/utils/hexcolor_util.dart';

class ThankYouWidget extends StatefulWidget {
  final ThankyouPage? field;
  const ThankYouWidget({super.key, required this.field});

  @override
  State<ThankYouWidget> createState() => _ThankYouWidgetState();
}

class _ThankYouWidgetState extends State<ThankYouWidget> {
  final SurveyDesignFieldController surveyFieldController =
      Get.find<SurveyDesignFieldController>();
  final SurveyScreenManager surveyScreenManager =
      Get.find<SurveyScreenManager>();
  final SubmitSurveyManagerController submitsurvey =
      Get.put(SubmitSurveyManagerController());
  final SurveryApiFeedbackController surveyApicontroller =
      Get.find<SurveryApiFeedbackController>();
  final SurveyCollectDataController surveyCollectDataController =
      Get.find<SurveyCollectDataController>();
  @override
  void initState() {
    super.initState();
    asyncDurationValue();
  }

  @override
  void dispose() {
    super.dispose();
  }

  List<SurveyResponse>? createSurveyResponseData() {
    List<SurveyResponse> listSurveyResponse = [];

    surveyCollectDataController.surveyIndexData.forEach((key, value) {
      dynamic surveyDetail = surveyCollectDataController.createDataForApiHit(key, surveyScreenManager.mapSurveyIdAndFieldName[key] ?? "");
      if (surveyDetail is List<SurveyResponse>) {
        listSurveyResponse.addAll(surveyDetail);
      } else if (surveyDetail is SurveyResponse) {
        listSurveyResponse.add(surveyDetail);
      }
    });

    return listSurveyResponse.isNotEmpty ? listSurveyResponse : null;
  }

  Future<void> asyncDurationValue() async {
    print("surveymodel ");
    await submitsurvey.call(SurveySubmitModel(responseType: 'Online',
        surveyId: surveyApicontroller.surveyModel.value.id,
        surveyResponse: createSurveyResponseData()));
        print("helloworld");
        surveyCollectDataController.surveyIndexData.clear();
    await Future.delayed(Duration(seconds: surveyFieldController.thankyouScreenTimeout.value));
    surveyScreenManager.updateScreenTypeUtilFunction();
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          onError: (exception, stackTrace) {},
          fit: BoxFit.cover,
          image:
              NetworkImage(surveyFieldController.thankyouPageUrlBg.value),
        ),
        color: HexColor(widget.field?.pageBgColor ?? ""),
      ),
      child: Column(
        children: [
          Expanded(
            child: SizedBox(
              height: 100.h,
              child: Image.network(
                surveyFieldController.thankyouPageUrlLogo.value,
                errorBuilder: (context, error, stackTrace) {
                  return Container();
                },
              ),
            ),
          ),
          SizedBox(
            height: 100.h,
          ),
          Expanded(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                      widget
                              .field!
                              .translations![surveyFieldController
                                  .defaultTranslation.value]
                              ?.upperText ??
                          "",
                      style: TextStyle(
                          fontSize: 10.sp,
                          fontFamily:
                              widget.field?.fontFamilyUpperText ?? "",
                          color: HexColor(
                              widget.field?.fontColorUpperText ?? ""))),
                ),
              
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10.w),
                    child: Text(
                        widget
                                .field!
                                .translations![surveyFieldController
                                    .defaultTranslation.value]
                                ?.bottomText ??
                            "",
                            textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 8.sp,
                            
                            fontFamily:
                                widget.field?.fontFamilyBottomText ?? "",
                            color: HexColor(
                                widget.field?.fontColorBottomText ?? ""))),
                  ),
                ),
            
              ],
            ),
          ),
         Obx(
         () {
          if(surveyFieldController.screenBotton.value == SuveryScreenBottom.templateBottomBar){
            return const TemplateBottomFeedback();
          }
          return const ExitWidget();
        }
      )
        ],
      ),
    );
  }
}
