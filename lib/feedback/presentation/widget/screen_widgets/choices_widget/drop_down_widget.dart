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

class DropDownWidget extends StatefulWidget {
  final Field field;
  const DropDownWidget({super.key, required this.field});

  @override
  State<DropDownWidget> createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> with SingleTickerProviderStateMixin {
  final SurveyDesignFieldController surveyFieldController =  Get.find<SurveyDesignFieldController>();
  Choice? choiceId;
  late ValidationLogicManager validationLogicManager;
  final SurveyCollectDataController surveyCollectDataController = Get.find<SurveyCollectDataController>();
  final BlinkingAnimmationController _animationController =  BlinkingAnimmationController();
  final SurveyScreenManager surveyScreenManager =  Get.find<SurveyScreenManager>();


  @override
  void initState() {
    if (surveyCollectDataController.surveyIndexData.containsKey(widget.field.id)) {
      choiceId = surveyCollectDataController.surveyIndexData[widget.field.id]  as Choice?;
    }
    validationLogicManager = ValidationLogicManager(field: widget.field);
    _animationController.initAnimationController(this);
    super.initState();
  }

Color hexToColor(String hexColor) {
  return Color(int.parse(hexColor.replaceFirst('#', '0xFF')));
}

String colorToHex(Color color) {
  return '#${color.value.toRadixString(16).padLeft(8, '0').toUpperCase()}';
}

Color lightenColor(String hexColor, double amount) {
  assert(amount >= 0 && amount <= 1, 'Amount should be between 0 and 1');
  
  Color color = hexToColor(hexColor);
  
  int r = color.red;
  int g = color.green;
  int b = color.blue;

  int rLight = (r + (255 - r) * amount).toInt();
  int gLight = (g + (255 - g) * amount).toInt();
  int bLight = (b + (255 - b) * amount).toInt();

  return Color.fromARGB(color.alpha, rLight, gLight, bLight);
}
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AnimatedBuilder(
        animation: _animationController.animation,
        builder: (context, child) {
          return Opacity(
            opacity: _animationController.animation.value,
            child: DropdownButtonFormField(
                value: choiceId,
                hint: const Text('Select'),
                isExpanded: true,
                icon: const Icon(Icons.keyboard_arrow_down),
                isDense: true,
                style: TextStyle(
                  color: HexColor(surveyFieldController.optionTextColor.value),
                ),
                validator: (value) {
                  if (widget.field.required == true && choiceId == null) {
                    return validationLogicManager.requiredFormValidator(choiceId == null);
                  }
                  surveyCollectDataController.updateSurveyData(quesId: widget.field.id ?? "", value: choiceId);
                  return null;
                },
            decoration: InputDecoration(
            constraints: BoxConstraints(
            maxWidth: size.width / 2,
                maxHeight: size.height/8
            ),
            filled: true,
            fillColor: HexColor(surveyFieldController.optionTextColor.value).withAlpha(50),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide(
                color: HexColor(surveyFieldController.optionTextColor.value),// Set the color of the border
                width: 1,        // Set the width of the border
              ),
            ),
            border:OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0), // Optional: For rounded borders
              borderSide: BorderSide(
                color: HexColor(surveyFieldController.optionTextColor.value),// Set the color of the border
                width: 1,        // Set the width of the border
              ),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 4.w),
                        ),
                dropdownColor:  Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10.r),
                alignment: AlignmentDirectional.centerStart,
                padding: const EdgeInsets.all(0),
                items: widget.field.choices.map<DropdownMenuItem<Choice>>((Choice value) {
                  return DropdownMenuItem<Choice>(
                    value: value,
                    child:  Text(
                        value.translations[surveyFieldController.defaultTranslation.value]?.name ??"",
                        style:const  TextStyle(
                          color: Colors.black,
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
          );
        });
  }
}
