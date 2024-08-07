import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/field_model.dart';
import 'package:zonka_feedback/feedback/presentation/manager/blinking_animation_controller.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survery_api_feedback_controller.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_collect_data_controller.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_design_controller.dart';
import 'package:zonka_feedback/utils/hexcolor_util.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:zonka_feedback/feedback/presentation/manager/validation_logic_manager.dart';
import 'package:zonka_feedback/utils/logic_file.dart';

class ButtonChoiceWidget extends StatefulWidget {
  final Field field;
  final bool isMultiple;
  const ButtonChoiceWidget({super.key, required this.field ,  required this.isMultiple});

  @override
  State<ButtonChoiceWidget> createState() => _ButtonChoiceWidgetState();
}

class _ButtonChoiceWidgetState extends State<ButtonChoiceWidget> with SingleTickerProviderStateMixin {
  final SurveryApiFeedbackController surveryFeedbackController = Get.find<SurveryApiFeedbackController>();
  final SurveyDesignFieldController surveyFieldController = Get.find<SurveyDesignFieldController>();
  final SurveyCollectDataController surveyCollectDataController = Get.find<SurveyCollectDataController>();
  late ValidationLogicManager validationLogicManager;
  Map<String, bool> _choiceMap = {};
  String choiceId = "";
  int? range = -1;
  final BlinkingAnimmationController _animationController = BlinkingAnimmationController();
  @override
  void initState() {
    super.initState();
     if(surveyCollectDataController.surveyIndexData.containsKey(widget.field.id)){
      _choiceMap = surveyCollectDataController.surveyIndexData[widget.field.id] as Map<String, bool>;
     }
     else{
      _choiceMap={};
      for (int i = 0; i < widget.field.choices.length; i++) {
        _choiceMap[widget.field.choices[i].id ?? ""] = false;
      }
     }
     validationLogicManager = ValidationLogicManager(field: widget.field);
     range = validationLogicManager.getRangeValue(widget.isMultiple);
    _animationController.initAnimationController(this);
  }

  @override
  Widget build(BuildContext context) {
    return FormField(
      validator: (value) {
      int trueCount = _choiceMap.values.where((value) => value == true).length;
      if (widget.field.required == true && trueCount == 0) {
        return validationLogicManager.requiredFormValidator(trueCount == 0);
      } else if (widget.field.specialSettingVal == 'range') {
        String? value = validationLogicManager.rangeValidator(trueCount);
        if (value == null) {
          surveyCollectDataController.updateSurveyData(quesId: widget.field.id ?? "", value: _choiceMap);
        }
        return value;
      } else if (widget.field.specialSettingVal == 'exact') {
        String? value = validationLogicManager.exactFormValidator(trueCount);
        if (value == null) {
          surveyCollectDataController.updateSurveyData(quesId: widget.field.id ?? "", value: _choiceMap);
        }
        return value;
      }
      surveyCollectDataController.updateSurveyData(quesId: widget.field.id ?? "", value: _choiceMap);
      return null;
    }, builder: (context) {
      return GridView.builder(
        padding: EdgeInsets.zero,
          shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 3.5,
            mainAxisSpacing: 10,
            crossAxisSpacing: 15),
        itemCount: widget.field.choices.length, // <-- required
        itemBuilder: (context, i) => GestureDetector(
          onTap: ()async  {
           if(widget.isMultiple){
            int trueCount = _choiceMap.values.where((value) => value == true).length;
            if (range != -1 && trueCount == range && !_choiceMap[widget.field.choices[i].id]!) {
              Fluttertoast.showToast(
                  msg: 'You can select only $range options',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
            } else {
              _choiceMap.update(widget.field.choices[i].id ?? "", (value) => !value);
              setState(() {});
            }
                
           }
           else{
              for (int i = 0; i < widget.field.choices.length; i++) {
               _choiceMap[widget.field.choices[i].id ?? ""] = false;
             } 
             _choiceMap[widget.field.choices[i].id ?? ""] = true;
              setState(() {});
           }
           
           choiceId = widget.field.choices[i].id ?? "";
           for(int i = 0 ;i<2;i++){
                await _animationController.blinkingAnimation();         
                 setState(() {});
          }
          },
          child: AnimatedBuilder(
            animation: _animationController.animation,
            builder: (context,child) {
              return Opacity(
                opacity: _choiceMap[widget.field.choices[i].id ?? ""]??false   
                    ? choiceId == widget.field.choices[i].id ? _animationController.animation.value
                    : 1 : 1,
                child: Container(
                  margin: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.r)),
                    border: Border.all(color: Colors.black, width: 0.5),
                    color: HexColor(surveyFieldController.optionTextColor.value)
                        .withOpacity(_choiceMap[widget.field.choices[i].id] ?? false
                            ? 1
                            : 0.1),
                  ),
                  child: Center(
                      child: Text(
                          widget
                                  .field
                                  .choices[i]
                                  .translations[surveyFieldController
                                      .defaultTranslation.value]
                                  ?.name ??
                              '',
                          style: TextStyle(
                              fontFamily: surveryFeedbackController
                                  .surveyModel.value.fontFamily,
                         
                              color:_choiceMap[widget.field.choices[i].id] == false ?  HexColor(surveyFieldController.optionTextColor.value) :HexColor(LogicFile().getContrastColor(surveyFieldController.optionTextColor.value))
                         
                                      
                                      ))),
                ),
              );
            }
          ),
        ),
      );
    });
  }
}




// https://zonkafeedback-gallery.s3.amazonaws.com/img_gallery/5f9963a3bc8868234ca1f015/1720507454728_97083.png