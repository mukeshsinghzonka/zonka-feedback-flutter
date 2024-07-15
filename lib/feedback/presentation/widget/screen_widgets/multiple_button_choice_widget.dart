import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/field_model.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survery_api_feedback_controller.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_dynamic_controller.dart';
import 'package:zonka_feedback/utils/hexcolor_util.dart';

class ButtonChoiceWidget extends StatefulWidget {
  final Field field;
  const ButtonChoiceWidget({super.key, required this.field});

  @override
  State<ButtonChoiceWidget> createState() => _ButtonChoiceWidgetState();
}

class _ButtonChoiceWidgetState extends State<ButtonChoiceWidget> {
  final SurveryFeedbackController surveryFeedbackController =
      Get.find<SurveryFeedbackController>();
  final SurveyFieldController surveyFieldController =
      Get.find<SurveyFieldController>();

  static final Map<String, bool> _choiceMap = {};

  @override
  Widget build(BuildContext context) {
    return FormField(
  
      validator: (value) {
     
        return widget.field.fieldName ?? '';   },
      builder: (context) {
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
                 if (!_choiceMap.containsKey(widget.field.choices[i].id)) {
                    _choiceMap[widget.field.choices[i].id ?? ""] = true;
                  } else {
                    _choiceMap.update(widget.field.choices[i].id ?? "", (value) => !value);
                  }
                  setState(() {});
              },
              child: Container(
                margin: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.r)),
                  border: Border.all(color: Colors.black, width: 0.5),
                  color: HexColor(surveyFieldController.optionTextColor.value)
                      .withOpacity(
                          _choiceMap[widget.field.choices[i].id] ?? false
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
                            color: _choiceMap[
                                        widget.field.choices[i].id ?? ""] ??
                                    false
                                ? Colors.white
                                : HexColor(surveyFieldController
                                    .optionTextColor.value)))),
              ),
            ),
          ),
        );
      }
    );
  }
}




// https://zonkafeedback-gallery.s3.amazonaws.com/img_gallery/5f9963a3bc8868234ca1f015/1720507454728_97083.png