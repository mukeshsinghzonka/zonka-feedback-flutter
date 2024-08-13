import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_design_controller.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_next_screen_controller.dart';
import 'package:zonka_feedback/utils/hexcolor_util.dart';

class ExitWidget extends StatefulWidget {
  const ExitWidget({super.key});

  @override
  State<ExitWidget> createState() => _ExitWidgetState();
}

class _ExitWidgetState extends State<ExitWidget> {
  final SurveyDesignFieldController surveyFieldController =
      Get.find<SurveyDesignFieldController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
          Expanded(
            flex: 7,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                'Powered By Zonka FeedBack',
                style: TextStyle( fontFamily: surveyFieldController.fontFamily.value, fontSize: 6.sp),
              ),
            )),
        GestureDetector(
          onTap: () {
          Navigator.of(context).pop();
           Get.delete<SurveyScreenManager>();
          },
          child: Container(
            alignment: Alignment.bottomCenter,
            child:  Container(
              width: 50.w,
              height: 30.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5.r)),
              color: HexColor(surveyFieldController.buttonColor.value),),
              child:  Text(
                'Exit',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontFamily: surveyFieldController.fontFamily.value),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
