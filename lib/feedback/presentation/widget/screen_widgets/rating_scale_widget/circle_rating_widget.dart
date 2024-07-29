import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/field_model.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_design_controller.dart';
import 'package:zonka_feedback/utils/hexcolor_util.dart';

class CircleRatingWidget extends StatefulWidget {
  final Field field;
  const CircleRatingWidget({super.key, required this.field});

  @override
  State<CircleRatingWidget> createState() => _CircleRatingWidgetState();
}

class _CircleRatingWidgetState extends State<CircleRatingWidget> {
  List colorRating = ['#D13900', '#D36501', '#FEE202', '#CFFD04', '#ABFD03'];
  final SurveyDesignFieldController surveyFieldController =
      Get.find<SurveyDesignFieldController>();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.field.options.length,
        itemBuilder: (context, indexOption) {
          return Column(
            children: [
              Text(
                widget
                        .field
                        .options[indexOption]
                        .translations?[
                            surveyFieldController.defaultTranslation.value]
                        ?.name ??
                    "",
                style: TextStyle(
                  fontSize: 7.sp,
                  fontFamily: surveyFieldController.fontFamily.value,
                ),
              ),
              Container(
                height: 80.h,
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.blueAccent)),
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: ListView.builder(
                          itemCount: 5,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Container(
                              height: 20.h,
                              width: 20.w,
                              margin: EdgeInsets.all(1.w),
                              decoration: BoxDecoration(
                                color: HexColor(colorRating[index]),
                                shape: BoxShape.circle,
                              ),
                            );
                          }),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "hello1",
                            style: TextStyle(
                              fontSize: 5.sp,
                              fontFamily:surveyFieldController.fontFamily.value,
                            ),
                          ),
                          Text(
                            "hello2",
                            style: TextStyle(
                              fontSize: 5.sp,
                              fontFamily:
                                  surveyFieldController.fontFamily.value,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        });
  }
}
