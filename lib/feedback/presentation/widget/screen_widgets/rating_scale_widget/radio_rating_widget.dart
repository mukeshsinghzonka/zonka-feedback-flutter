import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/field_model.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_design_controller.dart';
import 'package:zonka_feedback/feedback/presentation/manager/validation_logic_manager.dart';

class RadioRatingLableWidget extends StatefulWidget {
  final Field field;
  const RadioRatingLableWidget({super.key, required this.field});

  @override
  State<RadioRatingLableWidget> createState() => _RadioRatingLableWidgetState();
}

class _RadioRatingLableWidgetState extends State<RadioRatingLableWidget> with SingleTickerProviderStateMixin {
  final SurveyDesignFieldController surveyFieldController = Get.find<SurveyDesignFieldController>();

  Map<String, String> _choiceMap = {};
  Map<String, int> _optionMap = {};
  late ValidationLogicManager validationLogicManager;
  int rowIndx = -1;
  int colIndx = -1;

  @override
  void initState() {
    for (int i = 0; i < widget.field.options.length; i++) {
      _optionMap[widget.field.options[i].id ?? ""] = -1;
    }

    for (int i = 0; i < widget.field.options.length; i++) {
      _choiceMap[widget.field.options[i].id ?? ""] = "";
    }
    colIndx = widget.field.choices.length;
    rowIndx = widget.field.options.length;
     validationLogicManager = ValidationLogicManager(field: widget.field);

   
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
       margin: EdgeInsets.all(5.w),
       child:Column(
        children: [
         // Show Choice Text 
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 50.w,
              ),
            for(int j = 0 ; j < colIndx-1 ; j++)
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(2.w),
                  child: Text("${widget.field.choices[j].translations[surveyFieldController.defaultTranslation.value]?.name}",
                  textAlign: TextAlign.center,
                    style: TextStyle(
                  fontSize: 8.h
                ),
                  ),
                ),
              ),
            ],
          ),

      // Show radio button 
        for(int i = 0 ; i < rowIndx ; i++)
          Row(
            children: [
              Container(
                width: 50.w,
                alignment: Alignment.center,
                padding: EdgeInsets.all(2.w),
                child: Text("${widget.field.options[i].translations![surveyFieldController.defaultTranslation.value]?.name}",
                style: TextStyle(
                    fontSize: 8.h
                ),
                
                ),
              ),
              for(int j = 0 ; j < colIndx -1; j++)
              Expanded(
                child: Radio(
                  value: widget.field.choices[j].id,
                  groupValue: _choiceMap[widget.field.options[i].id],
                  onChanged: (value) async {
                    setState(() {
                      _choiceMap[widget.field.options[i].id??""] = value??"";
                    });
                                     
                  },
                ),
              ),
            ],
          ),
          
        ],
      )
    );
  }
}
