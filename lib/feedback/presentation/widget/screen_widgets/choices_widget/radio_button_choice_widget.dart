import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/field_model.dart';
import 'package:zonka_feedback/feedback/presentation/manager/blinking_animation_controller.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_collect_data_controller.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_design_controller.dart';
import 'package:zonka_feedback/feedback/presentation/manager/validation_logic_manager.dart';
import 'package:zonka_feedback/utils/hexcolor_util.dart';
import 'package:zonka_feedback/utils/logic_file.dart';

class RadioButtonWidget extends StatefulWidget {
  final Field field;
  
  const RadioButtonWidget({super.key, required this.field});

  @override
  State<RadioButtonWidget> createState() => _RadioButtonWidgetState();
}

class _RadioButtonWidgetState extends State<RadioButtonWidget>  with SingleTickerProviderStateMixin {

  final SurveyDesignFieldController surveyFieldController = Get.find<SurveyDesignFieldController>();
  late ValidationLogicManager validationLogicManager;
  final SurveyCollectDataController surveyCollectDataController = Get.find<SurveyCollectDataController>();
  static String ? choiceId;
  String choiceIdCheck = "";
  final BlinkingAnimmationController _animationController = BlinkingAnimmationController();
  @override
  void initState() {
  if(surveyCollectDataController.surveyIndexData.containsKey(widget.field.id)){
     choiceId =  surveyCollectDataController.surveyIndexData[widget.field.id] as String? ??"";
  }
  else{
    choiceId = null;
  }
  validationLogicManager = ValidationLogicManager(field: widget.field);
  _animationController.initAnimationController(this);
  super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return FormField(
      validator: (value) { 
      if (widget.field.required == true && choiceId == null) {
        return validationLogicManager.requiredFormValidator(choiceId == null);
      }
      surveyCollectDataController.updateSurveyData(quesId: widget.field.id ?? "",  value: choiceId);
      return null;
      },
      builder: (context) {
        return GridView.builder(
          shrinkWrap:true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // Number of columns
            childAspectRatio: 4, // Aspect ratio of each grid item
            mainAxisSpacing: 10.0, // Space between the items vertically
            crossAxisSpacing: 10.0, // Space between the items horizontally
          ),
          itemCount: widget.field.choices.length, // Total number of items
          itemBuilder: (context, index) {
            return AnimatedBuilder(
              animation: _animationController.animation,
              builder: (context,cild) {
                return Opacity(
                  opacity: choiceId == widget.field.choices[index].id ? _animationController.animation.value: 1 ,
                  child: CustomRadioButton(
                    value: widget.field.choices[index].id,
                    groupValue: choiceId,
                    field: widget.field,
                    
                    choiceName: widget.field.choices[index].translations[surveyFieldController.defaultTranslation.value]?.name??"",
                    onChanged: (value) async {
                       choiceId = value;
                      for(int i = 0 ;i<2;i++){
                          await _animationController.blinkingAnimation();         
                          setState(() {});
                      }
                      setState(() {});
                    
                    },
                  ),
                );
              }
            );
          },
        );
      }
    );
  }
}

class CustomRadioButton extends StatelessWidget {
  final String?  value;
  final String ?groupValue;
  final Field field;
  final String choiceName;
  final ValueChanged<String?> onChanged;

   CustomRadioButton({super.key, 
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.field,
    required this.choiceName
  });
 final SurveyDesignFieldController surveyFieldController = Get.find<SurveyDesignFieldController>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(value),
      child: Container(
       
        margin: EdgeInsets.all(8.h),
        decoration: BoxDecoration(
            color:  HexColor(surveyFieldController.optionTextColor.value).withOpacity(groupValue==value ? 1 : 0.1),
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
            border: Border.all(color:  HexColor(surveyFieldController.optionTextColor.value)
                    ,)),
        child: Row(
          children: [
            Radio<String>(
              fillColor: WidgetStateProperty.all(
                groupValue == value ?HexColor(LogicFile().getContrastColor(surveyFieldController.optionTextColor.value)):  HexColor(surveyFieldController.optionTextColor.value)),
              value: value ?? "",
              groupValue: groupValue,
              onChanged: onChanged,
            ),
            Text(
              choiceName,
              style: TextStyle(
                fontFamily: surveyFieldController.fontFamily.value,
                color: groupValue == value ?HexColor(LogicFile().getContrastColor(surveyFieldController.optionTextColor.value)) : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
