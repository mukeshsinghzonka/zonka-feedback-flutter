import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/field_model.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_collect_data_controller.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_design_controller.dart';
import 'package:zonka_feedback/feedback/presentation/manager/validation_logic_manager.dart';
import 'package:zonka_feedback/utils/hexcolor_util.dart';

class TextboxWidget extends StatefulWidget {
  final Field field;
   const TextboxWidget({super.key, required this.field});

  @override
  State<TextboxWidget> createState() => _TextboxWidgetState();
}

class _TextboxWidgetState extends State<TextboxWidget> {

  String text = '';
  static final  TextEditingController _controller = TextEditingController();
  final SurveyDesignFieldController _surveyDesignFieldController = Get.find<SurveyDesignFieldController>();
  late ValidationLogicManager validationLogicManager;
  final SurveyCollectDataController surveyCollectDataController = Get.find<SurveyCollectDataController>();
  @override
  void initState() {
    
    validationLogicManager = ValidationLogicManager(field: widget.field);

     if(surveyCollectDataController.surveyIndexData.containsKey(widget.field.id)){
      _controller.text = surveyCollectDataController.surveyIndexData[widget.field.id] as String? ?? "";
     }
     else{
      _controller.text = "";
     }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250.w,
      child: TextFormField(
        
        validator: (value) {
          String ? valid = validationLogicManager.inputTextValidation(value);
          if(valid == null){
            surveyCollectDataController.updateSurveyData(quesId: widget.field.id ?? "", value: _controller.text);
          }
          return valid;
        },
        
        maxLines: 1,
        controller: _controller,
        style: TextStyle(
          
          color:  HexColor(_surveyDesignFieldController.optionTextColor.value),     
        ),
        decoration:  InputDecoration(   

         errorStyle:const TextStyle(color: Colors.white),
         hintText:  widget
                                .field
                            
                                .translations![_surveyDesignFieldController
                                    .defaultTranslation.value]
                                ?. placeHolder??
                            '',
         errorBorder:  OutlineInputBorder(
            borderSide: BorderSide(color: HexColor(_surveyDesignFieldController.optionTextColor.value), width: 1.0),
            borderRadius: BorderRadius.circular(10.0)
          ),
          focusedErrorBorder:OutlineInputBorder(
            borderSide: BorderSide(color: HexColor(_surveyDesignFieldController.optionTextColor.value), width: 1.0),
            borderRadius: BorderRadius.circular(10.0)
          ) ,
          filled: true,
          fillColor:  HexColor(_surveyDesignFieldController.optionTextColor.value).withOpacity(0.1),
          contentPadding: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 10.0),
          isDense: true,
          focusedBorder:  OutlineInputBorder(
            borderSide: BorderSide(color: HexColor(_surveyDesignFieldController.optionTextColor.value), width: 1.0),
            borderRadius: BorderRadius.circular(10.0)
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:  BorderSide(color: HexColor(_surveyDesignFieldController.optionTextColor.value), width: 1.0),
            borderRadius: BorderRadius.circular(10.0)
          ),
        ),
      ),
    );
  }
}