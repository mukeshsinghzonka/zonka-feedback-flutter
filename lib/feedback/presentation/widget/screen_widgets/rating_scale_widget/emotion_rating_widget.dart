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

  int rowIndx = -1;
  int colIndx = -1;

  @override
  void initState() {
    for (int i = 0; i < widget.field.options.length; i++) {
      _optionMap[widget.field.options[i].id ?? ""] = -1;
    }

    for (int i = 0; i < widget.field.options.length; i++) {
      _choiceMap[widget.field.options[i].id ?? ""] = "";
    }
    colIndx = widget.field.choices.length;
    rowIndx = widget.field.options.length;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
       margin: EdgeInsets.all(5.w),
       child:Column(
        children: [
         // Show Choice Text 
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 50.w,
              ),
            for(int j = 0 ; j < colIndx-1 ; j++)
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(2.w),
                  child: Text("${widget.field.choices[j].translations[surveyFieldController.defaultTranslation.value]?.helpText}",
                  textAlign: TextAlign.center,
                    style: TextStyle(
                  fontSize: 8.h
                ),
                  ),
                ),
              ),
            ],
          ),

      // Show radio button 
        for(int i = 0 ; i < rowIndx ; i++)
          Container(
            margin: EdgeInsets.all(5.w),
            child: Row(
              children: [
                Container(
                  width: 50.w,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(2.w),
                  child: Text("${widget.field.options[i].translations![surveyFieldController.defaultTranslation.value]?.name}",
                  style: TextStyle(
                      fontSize: 10.h
                  ),
                  ),
                ),
                for(int j = 0 ; j < colIndx - 1; j++)
                Expanded(
                  child: GestureDetector(
                                    onTap: () {
                                      _optionMap[
                                          widget.field.options[i].id ??
                                              ""] = j;
                                      _choiceMap[widget.field.options[i]
                                                  .id ??
                                              ""] =
                                          widget.field.choices[j].id ?? "";
                                      setState(() {});
                                    },
                                    child: Padding(
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 5.w),
                                        child: widget.field.iconType == 'svg'
                                            ? SvgPicture.asset(
                                                outlinedEmoji[j],
                                                height: 13.w,
                                              )
                                            : ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(120.r),
                                                child: SvgPicture.asset(
                                                  emojiConstant[widget
                                                              .field
                                                              .choices[j]
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
                                                                      i]
                                                                  .id ??
                                                              ""] ==
                                                          widget.field
                                                              .choices[j].id
                                                      ? null
                                                      : ColorFilter.mode(
                                                          Colors.white
                                                              .withOpacity(0.7),
                                                          BlendMode.color),
                                                ),
                                              )),
                                  )
                ),
              ],
            ),
          ),
          
        ],
      )
    );
  }
}

