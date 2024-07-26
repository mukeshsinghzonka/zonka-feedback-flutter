import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/field_model.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_design_controller.dart';

class ButtonRatingWidget extends StatefulWidget {
  final Field field;
  const ButtonRatingWidget({super.key, required this.field});

  @override
  State<ButtonRatingWidget> createState() => _ButtonRatingWidgetState();
}

class _ButtonRatingWidgetState extends State<ButtonRatingWidget> {
     final SurveyDesignFieldController surveyFieldController = Get.find<SurveyDesignFieldController>();
  @override
  Widget build(BuildContext context) {
  return FormField(validator: (value) {
      return null;
    }, builder: (context) {
      return GridView.builder(
        itemCount: widget.field.choices.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              
            },
            child: Container(
                height: 100.h,
                margin: EdgeInsets.all(5.h),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blueAccent),
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(5.r)),
                child: Text(
                  widget.field.choices[index].translations[surveyFieldController.defaultTranslation.value]?.name??'',
                  textAlign: TextAlign.center,
                  style:const TextStyle(color: Colors.white),
                )),
          );
        },
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: widget.field.choices.length,
        ),
      );
    });
  }
  }
