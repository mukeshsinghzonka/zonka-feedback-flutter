import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/field_model.dart';
import 'package:zonka_feedback/feedback/domain/entity/form_validator.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survery_api_feedback_controller.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_collect_data_controller.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_design_controller.dart';
import 'package:zonka_feedback/utils/enum_util.dart';
import 'package:zonka_feedback/utils/hexcolor_util.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ButtonChoiceWidget extends StatefulWidget {
  final Field field;
  const ButtonChoiceWidget({super.key, required this.field});

  @override
  State<ButtonChoiceWidget> createState() => _ButtonChoiceWidgetState();
}

class _ButtonChoiceWidgetState extends State<ButtonChoiceWidget> {
  final SurveryApiFeedbackController surveryFeedbackController = Get.find<SurveryApiFeedbackController>();
  final SurveyDesignFieldController surveyFieldController = Get.find<SurveyDesignFieldController>();
  final SurveyCollectDataController surveyCollectDataController = Get.find<SurveyCollectDataController>();
  static final Map<String, bool> _choiceMap = {};
  int range = -1;
  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.field.choices.length; i++) {
      _choiceMap[widget.field.choices[i].id ?? ""] = false;
    }
    if (widget.field.specialSettingVal == 'range') {
      range = int.parse(widget.field.specialSettingVal2![2]);
    }
    else if (widget.field.specialSettingVal == 'exact') {
      range = int.parse(widget.field.specialSettingVal3??"0");
    }
  }


  @override
  Widget build(BuildContext context) {
    return FormField(
      validator: (value) {
      int trueCount = _choiceMap.values.where((value) => value == true).length;
      if(trueCount == 0){
        FormValidator formValidator = FormValidator(
            value: ScreenValidationErrorType.REQUIRED,
            formId: widget.field.id ?? "",
        );
        return jsonEncode(formValidator.toJson());
      }
      else if (widget.field.specialSettingVal == 'range') {
        FormValidator formValidator = FormValidator(
            value: ScreenValidationErrorType.WRONGSELECTION,
            formId: widget.field.id ?? "",
        );
      int minVal = int.parse(widget.field.specialSettingVal2![0]);
      int maxVal = int.parse(widget.field.specialSettingVal2![2]);
      if (trueCount < minVal || trueCount > maxVal) {
        return jsonEncode(formValidator.toJson());
      }
      surveyCollectDataController.updateSurveyData(quesId: widget.field.id??"", value: _choiceMap);
      return null ;
      } else if (widget.field.specialSettingVal == 'exact') {
        FormValidator formValidator = FormValidator(
            value: ScreenValidationErrorType.WRONGSELECTION,
            formId: widget.field.id ?? "",
        );
        int exactVal = int.parse(widget.field.specialSettingVal3??"0");
        if (trueCount != exactVal) {
          return jsonEncode(formValidator.toJson());
        }
        surveyCollectDataController.updateSurveyData(quesId: widget.field.id??"", value: _choiceMap);
        return  null;
      }
      surveyCollectDataController.updateSurveyData(quesId: widget.field.id??"", value: _choiceMap);
      return null;
    }, builder: (context) {
      return Scrollbar(
        child: GridView.builder(
          padding: EdgeInsets.zero,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 3.5,
              mainAxisSpacing: 10,
              crossAxisSpacing: 15),
          itemCount: widget.field.choices.length, // <-- required
          itemBuilder: (context, i) => GestureDetector(
            onTap: () {
                int trueCount =_choiceMap.values.where((value) => value == true).length;
                if (range != -1 &&  trueCount == range && !_choiceMap[widget.field.choices[i].id]!) {
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
              
            },
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
                          color: _choiceMap[widget.field.choices[i].id ?? ""] ??
                                  false
                              ? Colors.white
                              : HexColor(surveyFieldController
                                  .optionTextColor.value)))),
            ),
          ),
        ),
      );
    });
  }
}




// https://zonkafeedback-gallery.s3.amazonaws.com/img_gallery/5f9963a3bc8868234ca1f015/1720507454728_97083.png