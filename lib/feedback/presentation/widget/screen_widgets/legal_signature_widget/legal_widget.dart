import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/field_model.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_collect_data_controller.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_design_controller.dart';
import 'package:zonka_feedback/feedback/presentation/manager/validation_logic_manager.dart';
import 'package:zonka_feedback/utils/hexcolor_util.dart';

class LegalWidget extends StatefulWidget {
  final Field field;
  const LegalWidget({super.key, required this.field});

  @override
  State<LegalWidget> createState() => _LegalWidgetState();
}

class _LegalWidgetState extends State<LegalWidget> {
  String ? groupValue;
  final SurveyDesignFieldController _surveyDesignFieldController = Get.find<SurveyDesignFieldController>();
  late  ValidationLogicManager validationLogicManager;
  final SurveyCollectDataController surveyCollectDataController = Get.find<SurveyCollectDataController>();
  @override
  void initState() {
    if(surveyCollectDataController.surveyIndexData.containsKey(widget.field.id)){
      groupValue = surveyCollectDataController.surveyIndexData[widget.field.id];
    }
    else{
      groupValue = null;
    }
    validationLogicManager = ValidationLogicManager(field: widget.field);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FormField(
      validator: (value) {
        if (widget.field.required == true && groupValue == null) {
         return validationLogicManager.requiredFormValidator(groupValue == null);
        }
        surveyCollectDataController.updateSurveyData(quesId: widget.field.id??'', value: groupValue);
        return null;
      },
      builder: (context) {
        return Column(
          children: [
            TextFormField(
              controller: TextEditingController(
              text: widget.field.translations![_surveyDesignFieldController.defaultTranslation.value]?.placeHolder??""),
               style: TextStyle(
                color: HexColor(_surveyDesignFieldController.optionTextColor.value),
              ),
              maxLines: 1,
              readOnly: true,
              decoration:   InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                fillColor: HexColor(_surveyDesignFieldController.optionTextColor.value).withOpacity(0.1),  
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color:  HexColor(_surveyDesignFieldController.optionTextColor.value)  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: HexColor(_surveyDesignFieldController.optionTextColor.value) ),
                ),
                focusedBorder: OutlineInputBorder(
                   borderSide: BorderSide(color: HexColor(_surveyDesignFieldController.optionTextColor.value) ),
                ),
              ),
            ),
          ListView.builder(
            shrinkWrap: true,
            physics:const NeverScrollableScrollPhysics(),
            itemCount: widget.field.choices.length,
            itemBuilder: (context, index) {
            return  Row(
                  children: [
                    Radio<String>(
                       focusColor: HexColor(_surveyDesignFieldController.optionTextColor.value),
                        activeColor: HexColor(_surveyDesignFieldController.optionTextColor.value),
                        value: widget.field.choices[index].id??"",
                        groupValue: groupValue,
                        onChanged: (String ? value) {
                          groupValue = value;
                          setState(() {});
                        }),
                     Text( widget.field.choices[index]. translations[_surveyDesignFieldController.defaultTranslation.value]?.name??"",style: TextStyle(
                      color: HexColor(_surveyDesignFieldController.optionTextColor.value),
                      fontFamily:_surveyDesignFieldController.fontFamily.value   
                     ),) 
                  ],
                );
             }),

          ],
        );
      }
    );
  }
}
