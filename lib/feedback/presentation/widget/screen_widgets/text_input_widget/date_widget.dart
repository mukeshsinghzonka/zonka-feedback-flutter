import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/field_model.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_collect_data_controller.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_design_controller.dart';
import 'package:zonka_feedback/feedback/presentation/manager/validation_logic_manager.dart';
import 'package:zonka_feedback/utils/hexcolor_util.dart';

class DateWidget extends StatefulWidget {
  final Field field;
  const DateWidget({super.key, required this.field});

  @override
  State<DateWidget> createState() => _DateWidgetState();
}

class _DateWidgetState extends State<DateWidget> {
 static DateTime? selectedDate;
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  final SurveyDesignFieldController _surveyDesignFieldController = Get.find<SurveyDesignFieldController>();
  late  ValidationLogicManager validationLogicManager;
  final SurveyCollectDataController surveyCollectDataController = Get.find<SurveyCollectDataController>();
  
  @override
  void initState() {
     if(surveyCollectDataController.surveyIndexData.containsKey(widget.field.id)){
      selectedDate = surveyCollectDataController.surveyIndexData[widget.field.id] as DateTime;
     }
     else{
      selectedDate = null;
     }
      validationLogicManager = ValidationLogicManager(field: widget.field);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FormField(
      validator: (value) {
        if(widget.field.required==true && selectedDate==null){
          return validationLogicManager.requiredFormValidator(selectedDate==null);
        }
        surveyCollectDataController.updateSurveyData(quesId: widget.field.id ?? "", value: selectedDate);
       return null;
      },
      builder: (formcontext) {
        return GestureDetector(
          onTap: () async {
            selectedDate = await showDatePicker(
              context: context,
              initialDate: selectedDate ?? DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2025),
            );
            setState(() {});
          },
          child: Container(
              width: 150.w,
              height: 40.h,
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              decoration: BoxDecoration(
                color: HexColor(_surveyDesignFieldController.optionTextColor.value).withOpacity(0.1),
                border: Border.all(color: HexColor(_surveyDesignFieldController.optionTextColor.value)),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Row(
                children: [
                  selectedDate != null
                      ? Text(formatter.format(selectedDate!),style: TextStyle(color:HexColor(_surveyDesignFieldController.optionTextColor.value) ),)
                      : Text(widget.field.translations![_surveyDesignFieldController.defaultTranslation.value]?. placeHolder??''),
                  const Spacer(),
                  Icon(
                    Icons.calendar_today,
                    size: 7.sp,
                  )
                ],
              )),
        );
      }
    );
  }
}
