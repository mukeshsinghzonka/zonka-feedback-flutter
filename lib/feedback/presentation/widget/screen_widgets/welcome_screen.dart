import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/intro_page_model.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_design_controller.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_next_screen_controller.dart';
import 'package:zonka_feedback/feedback/presentation/screens/widget/exit_widget.dart';
import 'package:zonka_feedback/feedback/presentation/screens/widget/template_widget.dart';
import 'package:zonka_feedback/utils/enum_util.dart';
import 'package:zonka_feedback/utils/hexcolor_util.dart';

class WelcomeWidget extends StatefulWidget {
  final IntroPage? introPage;
  const WelcomeWidget({super.key, required this.introPage});

  @override
  State<WelcomeWidget> createState() => _WelcomeWidgetState();
}

class _WelcomeWidgetState extends State<WelcomeWidget> {
  final SurveyDesignFieldController surveyFieldController =
      Get.find<SurveyDesignFieldController>();
  final SurveyScreenManager surveyScreenManager =
      Get.find<SurveyScreenManager>();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          onError: (exception, stackTrace) {},
          fit: BoxFit.cover,
          image: NetworkImage(surveyFieldController.introBgImageUrl.value),
        ),
        color: HexColor(widget.introPage?.pageBgColor ?? ""),
      ),
      child: Column(
        children: [
          Image.network(
            surveyFieldController.introLogoImageUrlLogo.value,
            width: 50.w,
            errorBuilder: (context, error, stackTrace) {
              return Container();
            },
          ),
          Expanded(
            flex: 14,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    widget
                            .introPage!
                            .translations![
                                surveyFieldController.defaultTranslation.value]
                            ?.upperText ??
                        "",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: HexColor(
                            widget.introPage?.fontColorUpperText ?? ""))),
                SizedBox(
                  height: 30.h,
                ),
                GestureDetector(
                  onTap: () {
                    surveyScreenManager.screenTypeEnumUtil.value =
                        ScreenTypeEnumUtil.surveryScreen;
                  },
                  child: Center(
                    child: Container(
                      height: 40.h,
                      width: 80.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10.r),
                        color: HexColor(
                            widget.introPage!.bgColorGetStartButton ?? ""),
                      ),
                      child: Text(
                          widget
                                  .introPage!
                                  .translations![surveyFieldController
                                      .defaultTranslation.value]
                                  ?.getStarted ??
                              "",
                          style: TextStyle(
                              color: HexColor(
                                  widget.introPage?.fontColorGetStartButton ??
                                      ""))),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Text(
                    widget
                            .introPage!
                            .translations![
                                surveyFieldController.defaultTranslation.value]
                            ?.bottomText ??
                        "",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: HexColor(
                            widget.introPage?.fontColorBottomText ?? ""))),
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
