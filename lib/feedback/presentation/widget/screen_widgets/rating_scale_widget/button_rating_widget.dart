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

class ButtonRatingWidget extends StatefulWidget {
  final Field field;
  const ButtonRatingWidget({super.key, required this.field});

  @override
  State<ButtonRatingWidget> createState() => _ButtonRatingWidgetState();
}

class _ButtonRatingWidgetState extends State<ButtonRatingWidget> with TickerProviderStateMixin {
  final SurveyDesignFieldController surveyFieldController = Get.find<SurveyDesignFieldController>();
  final BlinkingAnimmationController _animationController = BlinkingAnimmationController();
  static Choice ? choiceId;
  late ValidationLogicManager validationLogicManager;
  String optionId = "";
  final SurveyCollectDataController surveyCollectDataController = Get.find<SurveyCollectDataController>();
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
      return Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: widget.field.choices.length,
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () async {
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
                    opacity: choiceId == widget.field.choices[index]  ? _animationController.animation.value : 1,
                    child: Center(
                      child: Container(
                          padding: EdgeInsets.all(5.h),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              border: Border.all(color: widget.field.isButtonColored??false ? Colors.transparent: HexColor(surveyFieldController.optionTextColor.value).withOpacity(1)), 
                              color:HexColor(surveyFieldController.optionTextColor.value).withOpacity(choiceId!=null && choiceId == widget.field.choices[index]? 1 : 0.1),
                              borderRadius: BorderRadius.circular(5.r)),
                          child: Text(
                            widget.field.choices[index].translations[surveyFieldController.defaultTranslation.value]?.name??'',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: choiceId!=null && choiceId==widget.field.choices[index] ?  HexColor(LogicFile().getContrastColor(surveyFieldController.optionTextColor.value)) : HexColor(surveyFieldController.optionTextColor.value),
                              fontSize: 5.sp , 
                              fontFamily: surveyFieldController.fontFamily.value,),
                          )),
                    ),
                  );
                }
              ),
            );
          },
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: widget.field.choices.length,
            crossAxisSpacing: 10.h,
            childAspectRatio: 3
          ),
        ),
      );
    });
  }
  }
