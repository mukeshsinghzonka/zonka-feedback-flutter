import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/field_model.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_design_controller.dart';

class RadioRatingLableWidget extends StatefulWidget {
  final Field field;
  const RadioRatingLableWidget({super.key, required this.field});

  @override
  State<RadioRatingLableWidget> createState() => _RadioRatingLableWidgetState();
}

class _RadioRatingLableWidgetState extends State<RadioRatingLableWidget> {
  final SurveyDesignFieldController surveyFieldController = Get.find<SurveyDesignFieldController>();

  Map<String, String> _choiceMap = {};
  Map<String, int> _optionMap = {};
  @override
  void initState() {
    for (int i = 0; i < widget.field.options.length; i++) {
      _optionMap[widget.field.options[i].id ?? ""] = -1;
    }

    for (int i = 0; i < widget.field.options.length; i++) {
      _choiceMap[widget.field.options[i].id ?? ""] = "";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
          shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, indexOption) {
            return Row(
              children: [
                Container(
                  width: 50.w,
                   height: 40.h,
                   alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueAccent)),
                      child: Text(widget.field.options[indexOption].translations![surveyFieldController.defaultTranslation.value]?.name ??"",
                     style: TextStyle(fontFamily: surveyFieldController.fontFamily.value,fontSize: 7.sp,),
                  ),
                  ),
                Container(
                  width: 200.w,
                  height: 40.h,
                  decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
                  child: ListView.builder(
                      itemCount: widget.field.choices.length-1,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                           padding:  EdgeInsets.symmetric(horizontal: 10.w),
                          child: Radio(
                            value: widget.field.choices[index].id,
                            groupValue:_choiceMap[widget.field.options[indexOption].id ?? ""],
                            onChanged: (value) {
                              _choiceMap[widget.field.options[indexOption].id ?? ""] = value??'';
                              setState(() {});
                            },
                          ),
                        );
                      }),
                ),
              ],
            );
          },
          itemCount: widget.field.options.length);
    
  }
}
