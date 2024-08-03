import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/field_model.dart';
import 'package:zonka_feedback/feedback/presentation/manager/blinking_animation_controller.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_design_controller.dart';
import 'package:zonka_feedback/feedback/presentation/manager/validation_logic_manager.dart';

class ButtonRatingWidget extends StatefulWidget {
  final Field field;
  const ButtonRatingWidget({super.key, required this.field});

  @override
  State<ButtonRatingWidget> createState() => _ButtonRatingWidgetState();
}

class _ButtonRatingWidgetState extends State<ButtonRatingWidget> with SingleTickerProviderStateMixin {
  final SurveyDesignFieldController surveyFieldController = Get.find<SurveyDesignFieldController>();
  final BlinkingAnimmationController _animationController = BlinkingAnimmationController();
  static String ? choiceId;
  late ValidationLogicManager validationLogicManager;
  String optionId = "";

  @override
  void initState() {
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
      return null;
    }, builder: (context) {
      return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: widget.field.choices.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () async {
              choiceId = widget.field.choices[index].id??"";
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
                  opacity: choiceId==widget.field.choices[index].id  ? _animationController.animation.value : 1,
                  child: Center(
                    child: Container(
                      height: 50.h,
                         padding: EdgeInsets.all(10.h),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black ),
                            color: choiceId!=null && choiceId==widget.field.choices[index].id ? Colors.black: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(5.r)),
                        child: Text(
                          widget.field.choices[index].translations[surveyFieldController.defaultTranslation.value]?.name??'',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: choiceId!=null && choiceId==widget.field.choices[index].id?Colors.white:Colors.black,fontSize: 5.sp , fontFamily: surveyFieldController.fontFamily.value,),
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
        ),
      );
    });
  }
  }
