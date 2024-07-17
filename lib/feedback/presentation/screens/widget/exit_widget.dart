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
    return Stack(
      alignment: Alignment.centerRight,
      children: [
        Container(
            alignment: Alignment.center,
            decoration:BoxDecoration(border: Border.all(color: Colors.blueAccent)),
            child: Text(
              'Powered By Zonka FeedBack',
              style: TextStyle(fontFamily: 'Source Sans Pro', fontSize: 6.sp),
            )),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
           Get.delete<SurveyScreenManager>();
          },
          child: Container(
            width: 20.w,
            height: 25.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5.r)),
                color: HexColor(surveyFieldController.buttonColor.value),
                border: Border.all(color: Colors.blueAccent)),
            alignment: Alignment.center,
            child: const Text(
              'Exit',
              style:
                  TextStyle(color: Colors.white, fontFamily: 'Source Sans Pro'),
            ),
          ),
        ),
      ],
    );
  }
}
