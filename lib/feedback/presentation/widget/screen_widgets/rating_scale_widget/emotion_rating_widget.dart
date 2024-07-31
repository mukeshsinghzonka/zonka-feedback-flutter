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

  Map<String, String> emojiConstant = {
    'angry': ImageConstant.emoji_1,
    'sad': ImageConstant.emoji_2,
    'neutral': ImageConstant.emoji_3,
    'happy': ImageConstant.emoji_4,
    'overjoyed': ImageConstant.emoji_5,
  };

  List outlinedEmoji = [
    ImageConstant.outlinedemoji_1,
    ImageConstant.outlinedemoji_2,
    ImageConstant.outlinedemoji_3,
    ImageConstant.outlinedemoji_4,
    ImageConstant.outlinedemoji_5,
  ];
  Map<String, String> _choiceMap = {};
  Map<String, int> _optionMap = {};

  @override
  void initState() {
    for (int i = 0; i < widget.field.options.length; i++) {
      _optionMap[widget.field.options[i].id ?? ""] = -1;
    }

    for (int i = 0; i < widget.field.options.length; i++) {
      _choiceMap[widget.field.options[i].id ?? ""] = "";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return FormField(
      validator: (value) {
      return null;
      },
      builder: (context) {
      return ListView.builder(
          shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
          itemCount: widget.field.options.length,
          itemBuilder: (context, indexOption) {
            return Container(
              height: 100.h,
              alignment: Alignment.center,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.blueAccent)),
              child: Column(
                children: [
                  Text(
                    widget.field.options[indexOption].translations![ surveyFieldController.defaultTranslation.value]?.name ??
                        '',
                    style: TextStyle(
                      fontSize: 7.sp,
                      fontFamily: surveyFieldController.fontFamily.value,
                    ),
                  ),
                  Container(
                    height: 70.h,
                    width: 300.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent)),
                    child: ListView.builder(
                        itemCount: widget.field.choices.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Expanded(
                                flex: 2,
                                child: GestureDetector(
                                  onTap: () {
                                    _optionMap[
                                        widget.field.options[indexOption].id ??
                                            ""] = index;
                                    _choiceMap[widget.field.options[indexOption]
                                                .id ??
                                            ""] =
                                        widget.field.choices[index].id ?? "";
                                    setState(() {});
                                  },
                                  child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 5.w),
                                      child: widget.field.iconType == 'svg'
                                          ? SvgPicture.asset(
                                              outlinedEmoji[index],
                                              height: 13.w,
                                            )
                                          : ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(120.r),
                                              child: SvgPicture.asset(
                                                emojiConstant[widget
                                                            .field
                                                            .choices[index]
                                                            .translations[
                                                                surveyFieldController
                                                                    .defaultTranslation
                                                                    .value]
                                                            ?.name ??
                                                        ""] ??
                                                    "",
                                                height: 13.w,
                                                colorFilter: _choiceMap[widget
                                                                .field
                                                                .options[
                                                                    indexOption]
                                                                .id ??
                                                            ""] ==
                                                        widget.field
                                                            .choices[index].id
                                                    ? null
                                                    : ColorFilter.mode(
                                                        Colors.white
                                                            .withOpacity(0.7),
                                                        BlendMode.color),
                                              ),
                                            )),
                                ),
                              ),
                              Expanded(
                                  child: SizedBox(
                                      width: 30.w,
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        widget
                                                .field
                                                .choices[index]
                                                .translations[
                                                    surveyFieldController
                                                        .defaultTranslation
                                                        .value]
                                                ?.helpText ??
                                            "",
                                      )))
                            ],
                          );
                        }),
                  ),
                ],
              ),
            );
          });
    });
  }
}
