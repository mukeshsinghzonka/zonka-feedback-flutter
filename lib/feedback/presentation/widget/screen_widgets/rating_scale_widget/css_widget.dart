

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/choice_model.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/field_model.dart';
import 'package:zonka_feedback/feedback/presentation/manager/animation/blinking_animation_controller.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_collect_data_controller.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_design_controller.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_next_screen_controller.dart';
import 'package:zonka_feedback/feedback/presentation/manager/validation_logic_manager.dart';
import 'package:zonka_feedback/utils/hexcolor_util.dart';
import 'package:zonka_feedback/utils/logic_file.dart';

class CesWidget extends StatefulWidget {
  final Field field;
  const CesWidget({super.key, required this.field});
  @override
  State<CesWidget> createState() => _CesWidgetState();
}

class _CesWidgetState extends State<CesWidget>  with SingleTickerProviderStateMixin{
  final SurveyDesignFieldController surveyFieldController = Get.find<SurveyDesignFieldController>();
  List gradientColors = [
     HexColor('#E43836'),
     HexColor('#FB674B'),
     HexColor('#FDA83E'),
     HexColor('#FDA83E'),
     HexColor('#E3C517'),
     HexColor('#9DCD07'),
     HexColor('#3CAE00'),
  ];
  Color selectedColor = HexColor('#F9BE00');
  Choice ? choiceId ;
  late ValidationLogicManager validationLogicManager;
  final SurveyCollectDataController surveyCollectDataController = Get.find<SurveyCollectDataController>();
  final BlinkingAnimmationController _animationController = BlinkingAnimmationController();
   final SurveyScreenManager surveyScreenManager = Get.find<SurveyScreenManager>();
  @override
  void initState() {
      if(surveyCollectDataController.surveyIndexData.containsKey(widget.field.id) && surveyCollectDataController.surveyIndexData[widget.field.id]!=null){
        choiceId = surveyCollectDataController.surveyIndexData[widget.field.id] as Choice? ;
     }
    validationLogicManager = ValidationLogicManager(field: widget.field);
    _animationController.initAnimationController(this);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
   return FormField(
    validator: (value) {
      if(widget.field.required == true && choiceId == null){
        return validationLogicManager.requiredFormValidator(choiceId == null);
      }
      surveyCollectDataController.updateSurveyData(quesId: widget.field.id ?? "", value: choiceId);
      return null;
    }, builder: (context) {
      return  Container(
        
        decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
        child: GridView.builder(
            itemCount: widget.field.choices.length,
            shrinkWrap: true,
            padding: const EdgeInsets.all(0),
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () async{
                  choiceId = widget.field.choices[index];
                      for(int i = 0 ;i<2;i++){
                        await _animationController.blinkingAnimation();         
                        setState(() {});
                      }
                  
                 Future.delayed(const Duration(milliseconds: 300), () {
   surveyScreenManager.nextScreen();
});
           
                },
                child: AnimatedBuilder(
                  animation: _animationController.animation,
                  builder: (context,child) {
                    return Opacity(
                      opacity: choiceId==widget.field.choices[index]  ? _animationController.animation.value : 1,
                      child: Center(
                        child: Container(
                            margin: EdgeInsets.all(5.h),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color : widget.field.isButtonColored == false ?  HexColor(surveyFieldController.optionTextColor.value).withOpacity(choiceId==widget.field.choices[index]? 1:0.3): choiceId!=null && choiceId != widget.field.choices[index]? selectedColor.withOpacity(0.4) : choiceId == widget.field.choices[index]? gradientColors[index]: gradientColors[index],
                                borderRadius: BorderRadius.circular(5.r)),
                              child: Text(
                              widget.field.choices[index].translations[surveyFieldController.defaultTranslation.value]?.name??'',
                              textAlign: TextAlign.center,
                              style: TextStyle(color:widget.field.isButtonColored == true ?    HexColor(LogicFile().getContrastColor(surveyFieldController.optionTextColor.value)) :choiceId==widget.field.choices[index] ? Colors.white: HexColor(surveyFieldController.optionTextColor.value)  ,fontSize: 5.w),
                            )),
                      ),
                    );
                  }
                ),
              );
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: widget.field.choices.length,
              childAspectRatio: 2
            ),
          ),
      );
    });
  }
}