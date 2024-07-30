import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:zonka_feedback/feedback/data/data_model_new/field_model.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_design_controller.dart';
import 'package:zonka_feedback/utils/image_constant.dart';

class EmotionRatingWidget extends StatefulWidget {
  final Field field;
  const EmotionRatingWidget({super.key, required this.field});

  @override
  State<EmotionRatingWidget> createState() => _EmotionRatingWidgetState();
}

class _EmotionRatingWidgetState extends State<EmotionRatingWidget> {
  final SurveyDesignFieldController surveyFieldController = Get.find<SurveyDesignFieldController>();
  List emojiConstant = [
    ImageConstant.emoji_1,
    ImageConstant.emoji_2,
    ImageConstant.emoji_3,
    ImageConstant.emoji_4,
    ImageConstant.emoji_5,
  ];

  List outlinedEmoji = [
    ImageConstant.outlinedemoji_1,
    ImageConstant.outlinedemoji_2,
    ImageConstant.outlinedemoji_3,
    ImageConstant.outlinedemoji_4,
    ImageConstant.outlinedemoji_5,
  ];


  @override
  Widget build(BuildContext context) {
    return FormField(validator: (value) {
      return null;
    }, builder: (context) {
      return ListView.builder(
          itemCount: widget.field.options.length,
          itemBuilder: (context, index) {
            return Container(
              height: 100.h,
              alignment: Alignment.center,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.blueAccent)),
              child: Column(
                children: [
                  Text(
                    widget
                            .field
                            .options[index]
                            .translations![
                                surveyFieldController.defaultTranslation.value]
                            ?.name ??
                        '',
                    style: TextStyle(
                      fontSize: 7.sp,
                      fontFamily: surveyFieldController.fontFamily.value,
                    ),
                  ),
                  Container(
                    height: 60.h,
                    width: 130.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent)),
                    child: ListView.builder(
                        itemCount: 5,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.w),
                            child: widget.field.iconType == 'svg'
                                ? SvgPicture.asset(
                                    outlinedEmoji[index],
                                    height: 13.w,
                                  )
                                : SvgPicture.asset(
                                    emojiConstant[index],
                                    height: 13.w,
                                  ),
                          );
                        }),
                  )
                ],
              ),
            );
          });
    });
  }
}
