import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/field_model.dart';
import 'package:zonka_feedback/feedback/presentation/manager/blinking_animation_controller.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_collect_data_controller.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_design_controller.dart';
import 'package:zonka_feedback/feedback/presentation/manager/validation_logic_manager.dart';
import 'package:zonka_feedback/utils/hexcolor_util.dart';
import 'package:zonka_feedback/utils/logic_file.dart';

class CheckboxWidget extends StatefulWidget {
  final Field field;
  final bool isMultiple;
  const CheckboxWidget({super.key, required this.field, required this.isMultiple});

  @override
  State<CheckboxWidget> createState() => _CheckboxWidgetState();
}

class _CheckboxWidgetState extends State<CheckboxWidget>  with SingleTickerProviderStateMixin {
  static Map<String, bool> _choiceMap = {};
  final SurveyDesignFieldController surveyFieldController = Get.find<SurveyDesignFieldController>();
  final SurveyCollectDataController surveyCollectDataController = Get.find<SurveyCollectDataController>();
  late ValidationLogicManager validationLogicManager;
  int ? range = -1;
  final BlinkingAnimmationController _animationController = BlinkingAnimmationController();
  String choiceId = "";
  @override
  void initState() {
 if(surveyCollectDataController.surveyIndexData.containsKey(widget.field.id)){
    _choiceMap = surveyCollectDataController.surveyIndexData[widget.field.id] as Map<String, bool>;
 }
  else{
    _choiceMap={};
  }
   if (_choiceMap.isEmpty) {
      for (int i = 0; i < widget.field.choices.length; i++) {
        _choiceMap[widget.field.choices[i].id ?? ""] = false;
      }
    }
    validationLogicManager = ValidationLogicManager(field: widget.field);
    range = validationLogicManager.getRangeValue(widget.isMultiple);
    _animationController.initAnimationController(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FormField(
      validator: (value) {
      int trueCount = _choiceMap.values.where((value) => value == true).length;
      if (widget.field.required == true && trueCount==0) {
       return validationLogicManager.requiredFormValidator(trueCount == 0);
      }
      else if (widget.field.specialSettingVal == 'range') {
       return validationLogicManager.rangeValidator(trueCount);
      }
      else if (widget.field.specialSettingVal == 'exact') {
       return validationLogicManager.exactFormValidator(trueCount);
      }
      surveyCollectDataController.updateSurveyData(quesId: widget.field.id ?? "", value: _choiceMap);
      return null;
    }, builder: (context) {
      return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: widget.field.choices.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 4),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () async {
          
            int trueCount = _choiceMap.values.where((value) => value == true).length;
            if (range != -1 && trueCount == range && !_choiceMap[widget.field.choices[index].id]!) {
              Fluttertoast.showToast(
                  msg: 'You can select only $range options',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
            } else {
              _choiceMap.update(widget.field.choices[index].id ?? "", (value) => !value);
              setState(() {});
            }
               choiceId = widget.field.choices[index].id ?? "";
             for(int i = 0 ;i<2;i++){
                  await _animationController.blinkingAnimation();         
                  setState(() {});
              }

              },
              child: AnimatedBuilder(
                animation: _animationController.animation,
                builder: (context,child) {
                  return Opacity(
                opacity: _choiceMap[widget.field.choices[index].id ?? ""]??false   
                    ? choiceId == widget.field.choices[index].id ? _animationController.animation.value
                    : 1 : 1,
                    child: Container(
                      margin: EdgeInsets.all(5.w),
                      decoration: BoxDecoration(
                        color:  HexColor(surveyFieldController.optionTextColor.value).withOpacity(_choiceMap[widget.field.choices[index].id] ?? false
                            ? 1
                            : 0.1),
                        border: Border.all(color: HexColor(surveyFieldController.optionTextColor.value)),
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.r),
                        ),
                      ),
                      child: Row(
                        children: [
                          Transform.scale(
                            scale: 0.8,
                            child: Checkbox(
                              checkColor:_choiceMap[widget.field.choices[index].id]??false? HexColor(LogicFile().getContrastColor(surveyFieldController.optionTextColor.value)): HexColor(surveyFieldController.optionTextColor.value),
                              side: WidgetStateBorderSide.resolveWith(
                                (states) => BorderSide(
                                    width: 1.0,
                                    color:_choiceMap[widget.field.choices[index].id]??false?HexColor(LogicFile().getContrastColor(surveyFieldController.optionTextColor.value)): HexColor(surveyFieldController.optionTextColor.value)
                                        ),
                              ),
                              value:_choiceMap[widget.field.choices[index].id]??false,
                              activeColor:HexColor(surveyFieldController.optionTextColor.value).withOpacity(_choiceMap[widget.field.choices[index].id] ?? false
                            ? 1
                            : 0.1),
                              onChanged: (value) {},
                            ),
                          ),
                          Text(
                            widget
                                    .field
                                    .choices[index]
                                    .translations[surveyFieldController
                                        .defaultTranslation.value]
                                    ?.name ??
                                "",
                            style: TextStyle(
                                fontSize: 6.sp,
                                fontFamily: surveyFieldController.fontFamily.value,
                                
                                 color:_choiceMap[widget.field.choices[index].id]??false? HexColor(LogicFile().getContrastColor(surveyFieldController.optionTextColor.value)): HexColor(surveyFieldController.optionTextColor.value)
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
              ),
            );
          });
    });
  }
}
