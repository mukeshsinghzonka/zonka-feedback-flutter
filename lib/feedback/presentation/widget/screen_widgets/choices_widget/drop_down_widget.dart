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

class DropDownWidget extends StatefulWidget {
  final Field field;
  const DropDownWidget({super.key, required this.field});

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget>
    with SingleTickerProviderStateMixin {
  final SurveyDesignFieldController surveyFieldController =
      Get.find<SurveyDesignFieldController>();
  Choice? choiceId;
  late ValidationLogicManager validationLogicManager;
  final SurveyCollectDataController surveyCollectDataController =
      Get.find<SurveyCollectDataController>();
  final BlinkingAnimmationController _animationController =
      BlinkingAnimmationController();
  final SurveyScreenManager surveyScreenManager =
      Get.find<SurveyScreenManager>();
  @override
  void initState() {
    if (surveyCollectDataController.surveyIndexData
        .containsKey(widget.field.id)) {
      choiceId = surveyCollectDataController.surveyIndexData[widget.field.id]
          as Choice?;
    }
    validationLogicManager = ValidationLogicManager(field: widget.field);
    _animationController.initAnimationController(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationController.animation,
        builder: (context, child) {

          return Opacity(
            opacity: _animationController.animation.value,
            child: Container(
              width: 200.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: HexColor(surveyFieldController.optionTextColor.value).withOpacity(0.1)
                ,
                border: Border.all(
                  color: HexColor(surveyFieldController.optionTextColor.value),
                ),
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
              ),
              child: DropdownButtonFormField(
                  hint: const Text('Select'),
                  isExpanded: true,
                  isDense: true,
                  style: TextStyle(
                    color: HexColor(surveyFieldController.optionTextColor.value),
                  ),
                  validator: (value) {
                    if (widget.field.required == true && choiceId == null) {
                      return validationLogicManager
                          .requiredFormValidator(choiceId == null);
                    }
                    surveyCollectDataController.updateSurveyData(
                        quesId: widget.field.id ?? "", value: choiceId);
                    return null;
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 4.w),
                  ),
                  dropdownColor:HexColor(surveyFieldController.optionTextColor.value).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10.r),
                  alignment: AlignmentDirectional.centerStart,
                  // elevation: ,
                  items: widget.field.choices
                      .map<DropdownMenuItem<Choice>>((Choice value) {
                    return DropdownMenuItem<Choice>(
                      value: value,
                      child: Container(
                 
             width: double.infinity,
                      color:HexColor(surveyFieldController.optionTextColor.value).withOpacity(0.1) ,
                        child: Text(
                          value
                                  .translations[surveyFieldController
                                      .defaultTranslation.value]
                                  ?.name ??
                              "",
                          style: TextStyle(
                            color: HexColor(LogicFile().getContrastColor(
                                surveyFieldController.optionTextColor.value)),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) async {
                    choiceId = value;
                    for (int i = 0; i < 2; i++) {
                      await _animationController.blinkingAnimation();
                      setState(() {});
                    }
                    Future.delayed(const Duration(milliseconds: 300), () {
                      surveyScreenManager.nextScreen();
                    });
                  }),
            ),
          );
        });
  }
}
