import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/field_model.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_collect_data_controller.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_design_controller.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_next_screen_controller.dart';
import 'package:zonka_feedback/feedback/presentation/manager/validation_logic_manager.dart';
import 'package:zonka_feedback/utils/enum_util.dart';
import 'package:zonka_feedback/utils/hexcolor_util.dart';
import 'package:zonka_feedback/utils/logic_file.dart';

class TextboxWidget extends StatefulWidget {
  final Field field;
  final SurveyScreenenum screenenumType;
  
  const TextboxWidget({super.key, required this.field, required this.screenenumType});

  @override
  State<TextboxWidget> createState() => _TextboxWidgetState();
}

class _TextboxWidgetState extends State<TextboxWidget> {
  String text = '';
   final SurveyScreenManager surveyScreenManager = Get.find<SurveyScreenManager>();
  final TextEditingController _controller = TextEditingController();
  final SurveyDesignFieldController _surveyDesignFieldController = Get.find<SurveyDesignFieldController>();
  late ValidationLogicManager validationLogicManager;
  final SurveyCollectDataController surveyCollectDataController = Get.find<SurveyCollectDataController>();
  @override
  void initState() {
    validationLogicManager = ValidationLogicManager(field: widget.field);
    print("surveywidgetcontrolervalue ${surveyCollectDataController.surveyIndexData
        .containsKey(widget.field.id)} ${widget.field.id}");
    if (surveyCollectDataController.surveyIndexData
        .containsKey(widget.field.id)) {
      _controller.text = surveyCollectDataController.surveyIndexData[widget.field.id] as String? ?? "";
    } else {
      _controller.text = "";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom) /  1.5,
      child: SizedBox(
        width: 250.w,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: TextFormField(
                    
                validator: (value) {
                  String? valid = validationLogicManager.inputTextValidation(value);
            
                  if(valid!=null){
                    return valid;
                  }
                  if (valid == null) {
                    print("textsvaed");
                    surveyCollectDataController.updateSurveyData(quesId: widget.field.id ?? "", value: _controller.text);
                  }
                  return null;
                },
                maxLines: widget.screenenumType == SurveyScreenenum.textWidget? 1 : 4,
                controller: _controller,
                style: TextStyle(
                  fontFamily: _surveyDesignFieldController.fontFamily.value,
                  color: HexColor(_surveyDesignFieldController.optionTextColor.value),
                ),
                decoration: InputDecoration(
                  errorStyle: const TextStyle(color: Colors.transparent),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: HexColor(
                            _surveyDesignFieldController.optionTextColor.value),
                        width: 1.0),
                  ),
                  hintText: widget
                          .field
                          .translations![
                              _surveyDesignFieldController.defaultTranslation.value]
                          ?.placeHolder ??
                      '',
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: HexColor(
                              _surveyDesignFieldController.optionTextColor.value),
                          width: 1.0),
                      borderRadius: BorderRadius.circular(10.0)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: HexColor(
                              _surveyDesignFieldController.optionTextColor.value),
                          width: 1.0),
                      borderRadius: BorderRadius.circular(10.0)),
                  filled: true,
                  fillColor:
                      HexColor(_surveyDesignFieldController.optionTextColor.value)
                          .withOpacity(0.1),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 7.0, horizontal: 10.0),
                  isDense: true,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: HexColor(
                              _surveyDesignFieldController.optionTextColor.value),
                          width: 1.0),
                      borderRadius: BorderRadius.circular(10.0)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: HexColor(
                              _surveyDesignFieldController.optionTextColor.value),
                          width: 1.0),
                      borderRadius: BorderRadius.circular(10.0)),
                ),
              ),
            ),
           GestureDetector(
                  onTap: () async {
                    // if (surveyScreenManager.nextScreenstop.value == false) {
                    //   surveyScreenManager.nextScreen();
                    // }
               surveyScreenManager.nextScreen();
                  },
                  child: Container(      
                      width: 35.h,
                      padding: EdgeInsets.all(2.w),
                    
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: HexColor(_surveyDesignFieldController.buttonColor.value),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color:  HexColor(LogicFile().getContrastColor(_surveyDesignFieldController.buttonColor.value)),
                        size: 10.h,
                        weight: 20.sp,
                      )),
                )
          ],
        ),
      ),
    );
  }
}
