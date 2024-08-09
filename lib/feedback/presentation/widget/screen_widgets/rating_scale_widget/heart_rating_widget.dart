import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/field_model.dart';
import 'package:zonka_feedback/feedback/domain/entity/rating_data_collector.dart';
import 'package:zonka_feedback/feedback/presentation/manager/blinking_animation_controller.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_collect_data_controller.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_design_controller.dart';
import 'package:zonka_feedback/feedback/presentation/manager/validation_logic_manager.dart';
import 'package:zonka_feedback/utils/image_constant.dart';


class HeartRatingWidget extends StatefulWidget {
  final Field field;
  const HeartRatingWidget({super.key, required this.field});

  @override
  State<HeartRatingWidget> createState() => _HeartRatingWidgetState();
}

class _HeartRatingWidgetState extends State<HeartRatingWidget>with SingleTickerProviderStateMixin {
final SurveyDesignFieldController surveyFieldController = Get.find<SurveyDesignFieldController>();
final BlinkingAnimmationController _animationController = BlinkingAnimmationController();
final SurveyCollectDataController surveyCollectDataController = Get.find<SurveyCollectDataController>();
late ValidationLogicManager validationLogicManager;
int rowIndx = -1;
int colIndx = -1;
Map<String, String> _choiceMap = {};
Map<String, int> _optionMap = {};
String optionId= "";
  @override
  void initState() {

    if(surveyCollectDataController.surveyIndexData.containsKey(widget.field.id)){
      _choiceMap = (surveyCollectDataController.surveyIndexData[widget.field.id] as RatingDataCollector?)?.choiceMap??{};
      _optionMap = (surveyCollectDataController.surveyIndexData[widget.field.id] as RatingDataCollector?)?.optionMap??{};
    }
    else{
    for (int i = 0; i < widget.field.options.length; i++) {
      _optionMap[widget.field.options[i].id ?? ""] = -1;
    }

    for (int i = 0; i < widget.field.options.length; i++) {
      _choiceMap[widget.field.options[i].id ?? ""] = "";
    }
    }

    colIndx = widget.field.choices.length;
    rowIndx = widget.field.options.length;
    _animationController.initAnimationController(this);
    validationLogicManager = ValidationLogicManager(field: widget.field);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return FormField(
      validator: (value) {
      if(widget.field.required == true && _choiceMap.containsValue("")){
        return validationLogicManager.requiredFormValidator( _choiceMap.containsValue(""));
      }
      surveyCollectDataController.updateSurveyData(quesId: widget.field.id ?? "", value: RatingDataCollector(choiceMap: _choiceMap, optionMap: _optionMap));
      return null;
      },
      
      builder: (context) {
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
                    Visibility(
                      visible: widget.field.options[i].translations![surveyFieldController.defaultTranslation.value]?.name!="",
                      child: Container(
                        width: 50.w,
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(2.w),
                        child: Text("${widget.field.options[i].translations![surveyFieldController.defaultTranslation.value]?.name}",
                        style: TextStyle(
                            fontSize: 10.h
                        ),
                        ),
                      ),
                    ),
                    for(int j = 0 ; j < colIndx ; j++)
                    Expanded(
                      child:  GestureDetector(
                              onTap: () async  {
                                _optionMap[widget.field.options[i].id ??""] = j;
                                _choiceMap[widget.field.options[i].id ?? ""] = widget.field.choices[j].id ?? "";
                               optionId = widget.field.options[i].id ?? "";
                                for(int i = 0 ;i<2;i++){
                                  await _animationController.blinkingAnimation();         
                                  setState(() {});
                                }
        
                              },
                              child: AnimatedBuilder(
                                animation: _animationController.animation,
                                builder: (context,child) {
                                  return Opacity(
                                    opacity: _optionMap[widget.field.options[i].id ??""]! >= j && optionId == widget.field.options[i].id? _animationController.animation.value: 1,
                                    child: Container(
                                          margin: EdgeInsets.all(2.w),
                                          child: widget.field.iconType == 'svg'
                                              ? SvgPicture.asset(                              
                                                _optionMap[widget.field.options[i].id ??""]! < j ?   ImageConstant.outlinedHeart:ImageConstant.heartFilledSolid,
                                                  height: 40.h,
                                                )
                                              : SvgPicture.asset(
                                                  ImageConstant.heartSvg,
                                                  color: _optionMap[widget.field.options[i].id ?? ""]! < j && _optionMap[widget.field.options[i] .id ??""] != -1
                                                      ? Colors.red.withOpacity(0.3)
                                                      : Colors.red,
                                                  height: 40.h,
                                                ),
                                        ),
                                  );
                                }
                              ),
                            )
                    ),
                  ],
                ),
              ),
              
            ],
          )
        );
      }
    );
  }
}

