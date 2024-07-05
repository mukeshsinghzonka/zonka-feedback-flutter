import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_screen_manager.dart';
import 'package:zonka_feedback/feedback/presentation/widget/screen_widgets/button_choice_widget.dart';
import 'package:zonka_feedback/feedback/presentation/widget/screen_widgets/checkbox_widget.dart';
import 'package:zonka_feedback/feedback/presentation/widget/screen_widgets/csat_rating/csat_button_rating.dart';
import 'package:zonka_feedback/feedback/presentation/widget/screen_widgets/date_widget.dart';
import 'package:zonka_feedback/feedback/presentation/widget/screen_widgets/emotion_rating_widget.dart';
import 'package:zonka_feedback/feedback/presentation/widget/screen_widgets/nps_widget.dart';
import 'package:zonka_feedback/feedback/presentation/widget/screen_widgets/picture_choice_widget.dart';
import 'package:zonka_feedback/feedback/presentation/widget/screen_widgets/radio_button_choice_widget.dart';
import 'package:zonka_feedback/feedback/presentation/widget/screen_widgets/rank_rating_widget.dart';
import 'package:zonka_feedback/feedback/presentation/widget/screen_widgets/scale_rating_widget.dart';
import 'package:zonka_feedback/feedback/presentation/widget/screen_widgets/textbox_widget.dart';
import 'package:zonka_feedback/feedback/presentation/widget/screen_widgets/welcome_widget.dart';
import 'package:zonka_feedback/utils/enum_util.dart';

class SurveyScreen extends StatefulWidget {
  const SurveyScreen({super.key});

  @override
  State<SurveyScreen> createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {

  final  SurveyScreenManager surveyScreenManager = Get.put(SurveyScreenManager());
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
    super.initState();
  }


@override
  void dispose() {
     SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown]);
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: GetBuilder(
          init: surveyScreenManager,
          builder: (context) {
            return Container(
              width: size.width,
              height: size.height,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                      height: size.height / 1.4,
                      width: size.width / 1.1,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                               GestureDetector(
                          onTap: () {
                            surveyScreenManager.previousScreen();
                         
                          },
                           child: Container(
                            child: Icon(Icons.arrow_back_ios_new_sharp),
                           ),
                         ),
                           SizedBox(width: 50.w),
                              Container(
                                  height: 90.h,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.blueAccent)),
                                  child: const Text('Picture Choice')),
                         SizedBox(width: 50.w),
                         GestureDetector(
                          onTap: () {
                            surveyScreenManager.nextScreen();
                          },
                           child: Container(
                            child: Icon(Icons.forward),
                           ),
                         )
                            ],
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Builder(builder: (context) {
                            return Container(
                              height: 120.h,
                              width: 300.w,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              alignment: Alignment.topCenter,
                              child: _switchWidget(
                                  screen: surveyScreenManager.surveyScreenenum!),
                            );
                          })
                        ],
                      )),
                  SizedBox(
                    height: 20.h,
                  ),
                  const Text('Powered By Zonka FeedBack')
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}

Widget _switchWidget({required SurveyScreenenum screen}) {
  switch (screen) {
    case SurveyScreenenum.buttonChoice:
      return const ButtonChoiceWidget();
    case SurveyScreenenum.radioChoice:
      return const RadioButtonWidget();
    // case SurveyScreenenum.dropdownChoice:
    //   return const DropDownWidget();
    case SurveyScreenenum.checkboxChoice:
      return const CheckboxWidget();
    case SurveyScreenenum.pictureChoice:
      return const PictureChoiceWidget();
    case SurveyScreenenum.npsRating:
      return const NpsWidget();
    case SurveyScreenenum.cesRating:
    case SurveyScreenenum.csatButtonRating:
      return const CsatButtonRating();
    case SurveyScreenenum.scaleRating:
      return const ScaleRatingWidget();
    case SurveyScreenenum.rankingRating:
      return const RankRatingWidget();
    case SurveyScreenenum.starRating:
    case SurveyScreenenum.emotionRating:
      return const EmotionRatingWidget();
    case SurveyScreenenum.textWidget:
      return const TextboxWidget();
    case SurveyScreenenum.dateWidget:
      return const DateWidget();
     case SurveyScreenenum.welcomeWidget:
      return const WelcomeWidget();

    default:
      return Container();
  }
}
