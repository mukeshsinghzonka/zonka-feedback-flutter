import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/field_model.dart';
import 'package:zonka_feedback/feedback/domain/entity/rating_data_collector.dart';
import 'package:zonka_feedback/feedback/presentation/manager/animation/blinking_animation_controller.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_collect_data_controller.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_design_controller.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_next_screen_controller.dart';
import 'package:zonka_feedback/feedback/presentation/manager/validation_logic_manager.dart';
import 'package:zonka_feedback/utils/image_constant.dart';

class EmotionRatingWidget extends StatefulWidget {
  final Field field;
  const EmotionRatingWidget({super.key, required this.field});

  @override
  State<EmotionRatingWidget> createState() => _EmotionRatingWidgetState();
}

class _EmotionRatingWidgetState extends State<EmotionRatingWidget>
    with SingleTickerProviderStateMixin {
  final SurveyDesignFieldController surveyFieldController =
      Get.find<SurveyDesignFieldController>();
  final BlinkingAnimmationController _animationController =
      BlinkingAnimmationController();
  final SurveyCollectDataController surveyCollectDataController =
      Get.find<SurveyCollectDataController>();
  late ValidationLogicManager validationLogicManager;
    final SurveyScreenManager surveyScreenManager = Get.find<SurveyScreenManager>();
  Map<String, String> emojiConstant = {
    'angry': ImageConstant.angry_1,
    'sad': ImageConstant.sad_4,
    'neutral': ImageConstant.neutral_3,
    'happy': ImageConstant.happy_2,
    'overjoyed': ImageConstant.veryhappy_5,
  };
  String optionId = "";
  Map<String, String> outlinedEmoji = {
    'angry': ImageConstant.angryOutlinedemoji_1,
    'sad': ImageConstant.sadOutlinedemoji_5,
    'neutral': ImageConstant.neutralOutlinedemoji_4,
    'happy': ImageConstant.happyOutlinedemoji_2,
    'overjoyed': ImageConstant.inloveOutlinedemoji_3,
  };

  Map filledOutlinedEmoji = {
    'sad': ImageConstant.sadFilledSolid,
    'angry': ImageConstant.happyFilledSolid,
    'neutral': ImageConstant.neutralFilledSolid,
    'overjoyed': ImageConstant.inLoveFilled,
    'happy': ImageConstant.veryHappyFilledSolid,
  };
  Map<String, String> _choiceMap = {};
  Map<String, int> _optionMap = {};

  int rowIndx = -1;
  int colIndx = -1;

  @override
  void initState() {
    if (surveyCollectDataController.surveyIndexData
        .containsKey(widget.field.id)) {
      _choiceMap = (surveyCollectDataController.surveyIndexData[widget.field.id] as RatingDataCollector?) ?.choiceMap ??
          {};
      _optionMap = (surveyCollectDataController.surveyIndexData[widget.field.id]
                  as RatingDataCollector?)
              ?.optionMap ??
          {};
    } else {
      for (int i = 0; i < widget.field.options.length; i++) {
        _optionMap[widget.field.options[i].id ?? ""] = -1;
      }

      for (int i = 0; i < widget.field.options.length; i++) {
        _choiceMap[widget.field.options[i].id ?? ""] = "";
      }
    }
    colIndx = widget.field.choices.length;
    rowIndx = widget.field.options.length;
    validationLogicManager = ValidationLogicManager(field: widget.field);
    _animationController.initAnimationController(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FormField(validator: (value) {
      if (widget.field.required == true && _choiceMap.containsValue("")) {
        return validationLogicManager
            .requiredFormValidator(_choiceMap.containsValue(""));
      }
      surveyCollectDataController.updateSurveyData(
          quesId: widget.field.id ?? "",
          value: RatingDataCollector(
              choiceMap: _choiceMap, optionMap: _optionMap));
      return null;
    }, builder: (context) {
      return Container(
          margin: EdgeInsets.all(5.w),
          child: Column(
            children: [
              // Show Choice Text
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 50.w,
                  ),
                  for (int j = 0; j < colIndx - 1; j++)
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(2.w),
                        child: Text(
                          "${widget.field.choices[j].translations[surveyFieldController.defaultTranslation.value]?.helpText}",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 8.h),
                        ),
                      ),
                    ),
                ],
              ),

              // Show radio button
              for (int i = 0; i < rowIndx; i++)
                Container(
                  margin: EdgeInsets.all(5.w),
                  child: Row(
                    children: [
                      Visibility(
                        visible: widget
                                .field
                                .options[i]
                                .translations![surveyFieldController
                                    .defaultTranslation.value]
                                ?.name !=
                            "",
                        child: Container(
                          width: 50.w,
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(2.w),
                          child: Text(
                            "${widget.field.options[i].translations![surveyFieldController.defaultTranslation.value]?.name}",
                            style: TextStyle(fontSize: 10.h),
                          ),
                        ),
                      ),
                      for (int j = 0; j < colIndx; j++)
                        Expanded(
                            child: GestureDetector(
                         onTap: () async {
                            _optionMap[widget.field.options[i].id ?? ""] = j;
                            _choiceMap[widget.field.options[i].id ?? ""] = widget.field.choices[j].id ?? "";
                            optionId = widget.field.options[i].id ?? "";
                            for (int i = 0; i < 2; i++) {
                              await _animationController.blinkingAnimation();
                              setState(() {});
                            }
                      
                        if(_optionMap.values.contains(-1)==false){                         
                          Future.delayed(const Duration(milliseconds: 300), () {
                           surveyScreenManager.nextScreen();
                          });    
                        }


                          },
                          child: AnimatedBuilder(
                              animation: _animationController.animation,
                              builder: (context, child) {
                                return Opacity(
                                  opacity: optionId ==
                                              widget.field.options[i].id &&
                                          _optionMap[
                                                  widget.field.options[i].id ??
                                                      ""]! ==
                                              j
                                      ? _animationController.animation.value
                                      : 1,
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                                    child: widget.field.iconType == 'svg'
                                        ? SvgPicture.asset(
                                            _choiceMap[widget.field.options[i].id ??
                                                        ""] ==
                                                    widget.field.choices[j].id
                                                ? filledOutlinedEmoji[widget
                                                            .field
                                                            .choices[j]
                                                            .translations[
                                                                surveyFieldController
                                                                    .defaultTranslation
                                                                    .value]
                                                            ?.name ??
                                                        ""] ??
                                                    ""
                                                : outlinedEmoji[widget
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
                                          )
                                        : Center(
                                          child:  Stack(

                                              children: [
                                               
                                                SvgPicture.asset(
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
                                                    height: 16.w,
                                                                                          
                                                 
                                                  ),
                                                   Container(
                                                    height: 16.w,
                                                    width: 16.w,
                                                     decoration:  BoxDecoration(
         color: _choiceMap[widget.field.options[i].id] == "" ||
                                                            _choiceMap[widget
                                                                        .field
                                                                        .options[i]
                                                                        .id ??
                                                                    ""] ==
                                                                widget
                                                                    .field.choices[j].id
                                                        ? null
                                                        :
                                                            Colors.white
                                                                .withOpacity(0.5),
        shape: BoxShape.circle,
      ),
                                                
                                                           
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                  
                                );
                              }),
                        )),
                    ],
                  ),
                ),
            ],
          ));
    });
  }
}
