import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/field_model.dart';
import 'package:zonka_feedback/feedback/domain/entity/rating_data_collector.dart';
import 'package:zonka_feedback/feedback/presentation/manager/blinking_animation_controller.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_collect_data_controller.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_design_controller.dart';
import 'package:zonka_feedback/feedback/presentation/manager/validation_logic_manager.dart';
import 'package:zonka_feedback/utils/hexcolor_util.dart';


  class CircleRatingWidget extends StatefulWidget {
    final Field field;
    const CircleRatingWidget({super.key, required this.field});
  
    @override
    State<CircleRatingWidget> createState() => _CircleRatingWidgetState();
  }
  
  class _CircleRatingWidgetState extends State<CircleRatingWidget> with SingleTickerProviderStateMixin {
    List colorRating = ['#D13900', '#D36501', '#FEE202', '#CFFD04', '#ABFD03'];

  final SurveyDesignFieldController surveyFieldController = Get.find<SurveyDesignFieldController>();
  final BlinkingAnimmationController _animationController = BlinkingAnimmationController();
  Map<String, String> _choiceMap = {};
  Map<String, int> _optionMap = {};
  String optionId  ="";
  int rowIndx = -1;
  int colIndx = -1;
  final SurveyCollectDataController surveyCollectDataController = Get.find<SurveyCollectDataController>();
  late ValidationLogicManager validationLogicManager;
  @override
  void initState() {
     if(surveyCollectDataController.surveyIndexData.containsKey(widget.field.id)){
      _choiceMap = (surveyCollectDataController.surveyIndexData[widget.field.id] as RatingDataCollector).choiceMap;
      _optionMap = (surveyCollectDataController.surveyIndexData[widget.field.id] as RatingDataCollector).optionMap;
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
                for(int j = 0 ; j < colIndx ; j++)
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
                                        onTap: () async {
                                          _optionMap[widget.field.options[i].id ?? ""] = j;
                                          _choiceMap[widget.field.options[i].id ?? ""] = widget.field.choices[j].id ?? "";
                                           optionId = widget.field.options[i].id ?? ""; 
                                            for(int i = 0 ;i<2;i++){
                                  await _animationController.blinkingAnimation();         
                                  setState(() {});
                                }
                            
                                          setState(() {});
                                        },
                                        child: AnimatedBuilder(
                                          animation: _animationController.animation,
                                          builder: (context,child) {
                                            return Opacity(
                                             opacity:  optionId ==widget.field.options[i].id &&  _optionMap[widget.field.options[i].id ??""] == j? _animationController.animation.value: 1,
                                              child: Container(
                                                width: 30.w,
                                                height: 30.h,
                                               margin: EdgeInsets.symmetric(horizontal: 5.w),
                                                          
                                                decoration: widget.field.iconType == 'svg'
                                                    ? BoxDecoration(
                                                        color: _optionMap[widget.field.options[i].id ?? ""]==-1 ||   _optionMap[widget.field.options[i].id ?? ""]==j? HexColor(colorRating[j]): HexColor(colorRating[j]).withOpacity(0.2),
                                                        shape: BoxShape.circle,
                                                      )
                                                    :   _optionMap[widget.field.options[i].id ?? ""]==j?BoxDecoration(
                                                        color: HexColor(colorRating[j]),
                                                        shape: BoxShape.circle,
                                                      ): BoxDecoration(
                                                        border: Border.all(
                                                            color: HexColor(colorRating[j]),
                                                            width: 1.w),
                                                        shape: BoxShape.circle,
                                                      ) ,
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


