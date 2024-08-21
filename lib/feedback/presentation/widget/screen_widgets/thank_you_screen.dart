import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/thankyou_model.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_design_controller.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_next_screen_controller.dart';
import 'package:zonka_feedback/feedback/presentation/screens/widget/exit_widget.dart';
import 'package:zonka_feedback/utils/hexcolor_util.dart';

class ThankYouWidget extends StatefulWidget {
  final ThankyouPage? field;
  const ThankYouWidget({super.key, required this.field});

  @override
  State<ThankYouWidget> createState() => _ThankYouWidgetState();
}

class _ThankYouWidgetState extends State<ThankYouWidget> {
  final SurveyDesignFieldController surveyFieldController = Get.find<SurveyDesignFieldController>();
  final SurveyScreenManager surveyScreenManager = Get.find<SurveyScreenManager>();
  

  @override
  void initState() {
   
    super.initState();
  }

@override
void dispose() {

  super.dispose();
}
 Future<void> asyncDurationValue() async {
    await Future.delayed( Duration(seconds: surveyFieldController.thankyouScreenTimeout.value));
    // surveyScreenManager.updateScreenTypeUtilFunction();
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: asyncDurationValue(),
      builder:  (context, builder) {
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              onError: (exception, stackTrace) {},
              fit: BoxFit.cover,
              image: NetworkImage(surveyFieldController.thankyouPageUrlBg.value),
            ),
            color: HexColor(widget.field?.pageBgColor ?? ""),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 100.h,
                child: Image.network(
                  surveyFieldController.thankyouPageUrlLogo.value,
                  errorBuilder: (context, error, stackTrace) {
                    return Container();
                  },
                ),
              ),
              SizedBox(
                height: 100.h,
              ),

              Expanded(
                flex: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                 Text(
                    widget.field!.translations![surveyFieldController.defaultTranslation.value] ?.upperText ?? "",
                    style: TextStyle(
                        fontFamily: widget.field?.fontFamilyUpperText ?? "",
                        color: HexColor(widget.field?.fontColorUpperText ?? ""))),
                SizedBox(
                  height: 30.h,
                ),
                Text(
                    widget.field!.translations![surveyFieldController.defaultTranslation.value] ?.bottomText ?? "",
                    style: TextStyle(
                        fontFamily: widget.field?.fontFamilyBottomText ?? "",
                        color: HexColor(widget.field?.fontColorBottomText ?? ""))),

                     SizedBox(
                  height: 100.h,
                ),     
                  ],
                ),
              ),
             
              Expanded(
                child: Container(
                   decoration: BoxDecoration(
    border: Border.all(color: Colors.blueAccent)
  ),
                  margin: EdgeInsets.all(5.w),
                  alignment: Alignment.bottomCenter,
                  child:const ExitWidget()))
            ],
          ),
        );
      }
    );
  }
}
