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
class NpsWidget extends StatefulWidget {
  final Field field;
  const NpsWidget({super.key, required this.field});

  @override
  State<NpsWidget> createState() => _NpsWidgetState();
}

class _NpsWidgetState extends State<NpsWidget> with SingleTickerProviderStateMixin{
  int selected = -1;
   final SurveyDesignFieldController surveyFieldController = Get.find<SurveyDesignFieldController>();
   final SurveyCollectDataController surveyCollectDataController = Get.find<SurveyCollectDataController>();
   List gradientColors = [
     HexColor('#FF7574'),
     HexColor('#F9BE00'),
     HexColor('#76CE1E'),
  ];
  Choice ? choiceId;
  Color selectedColor = HexColor('#F9BE00');
  late ValidationLogicManager validationLogicManager;
  final BlinkingAnimmationController _animationController = BlinkingAnimmationController();
  final SurveyScreenManager surveyScreenManager = Get.find<SurveyScreenManager>();
  @override
  void initState() {
     if(surveyCollectDataController.surveyIndexData.containsKey(widget.field.id) && surveyCollectDataController.surveyIndexData[widget.field.id]!=null){
        choiceId = surveyCollectDataController.surveyIndexData[widget.field.id] as Choice?;
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
        // decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
        child: Column(
          children: [
            Visibility(
              visible:widget.field.translations![surveyFieldController.defaultTranslation.value]?.helpTextFirstOption!="" ,
              child: Text(widget.field.translations![surveyFieldController.defaultTranslation.value]?.helpTextFirstOption??'',style: TextStyle(fontSize: 7.sp, fontFamily: surveyFieldController.fontFamily.value),)),
             GridView.builder(
              itemCount: widget.field.choices.length,
              padding: const EdgeInsets.all(0),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: ()async  {
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
                        opacity: choiceId == widget.field.choices[index] ? _animationController.animation.value : 1,
                        child: Center(
                          child: Container(
                              margin: EdgeInsets.all(5.h),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                border: Border.all(color: widget.field.isButtonColored??false ? Colors.transparent: HexColor(surveyFieldController.optionTextColor.value).withOpacity(1)),     
                                color: widget.field.isButtonColored??false ?  choiceId !=null &&  choiceId != widget.field.choices[index]? selectedColor.withOpacity(0.4): choiceId == widget.field.choices[index]? selectedColor : index>=0 && index<=6? gradientColors[0]: index>=7 && index<=8? gradientColors[1]: gradientColors[2]:HexColor(surveyFieldController.optionTextColor.value).withOpacity(choiceId!=null && choiceId == widget.field.choices[index] ? 1 : 0.1) ,borderRadius: BorderRadius.circular(5.r)),
                                child: Text(widget.field.choices[index].translations[surveyFieldController.defaultTranslation.value]?.name??'',
                                style: TextStyle(color: widget.field.isButtonColored??false ? Colors.white : choiceId!=null && choiceId == widget.field.choices[index] ?  HexColor(LogicFile().getContrastColor(surveyFieldController.optionTextColor.value)): HexColor(surveyFieldController.optionTextColor.value)),
                              )),
                        ),
                      );
                    }
                  ),
                );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: widget.field.choices.length,
                childAspectRatio: 1.5
              ),
            ),
             Visibility(
              visible:widget.field.translations![surveyFieldController.defaultTranslation.value]?.helpTextLastOption!="" ,
              child: Text(widget.field.translations![surveyFieldController.defaultTranslation.value]?.helpTextLastOption??'',style: TextStyle(fontSize: 7.sp, fontFamily: surveyFieldController.fontFamily.value),)),
          
          ],
        ),
      );
    });
  }
}
