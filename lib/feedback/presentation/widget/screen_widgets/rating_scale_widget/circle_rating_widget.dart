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
    return FormField(
      validator: (value) {
        return null;
      },
      builder: (context) {
        return ListView.builder(
            shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
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
                    height: 70.h,
                    decoration:BoxDecoration(border: Border.all(color: Colors.blueAccent)),
                    child: ListView.builder(
                        itemCount: widget.field.choices.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Expanded(
                                flex: 3,
                                child: GestureDetector(
                                  onTap: () {
                                    _optionMap[widget.field.options[indexOption].id ?? ""] = index;
                                    _choiceMap[widget.field.options[indexOption].id ?? ""] = widget.field.choices[index].id ?? "";
                                    setState(() {});
                                  },
                                  child: Container(
                                    width: 20.w,
                                    margin: EdgeInsets.all(1.w),
                                    decoration: widget.field.iconType == 'emoji'
                                        ? BoxDecoration(
                                            color: HexColor(colorRating[index]),
                                            shape: BoxShape.circle,
                                          )
                                        :_choiceMap[widget.field.options[indexOption].id ??""]== widget.field.choices[index].id?BoxDecoration(
                                            color: HexColor(colorRating[index]),
                                            shape: BoxShape.circle,
                                          ): BoxDecoration(
                                            border: Border.all(
                                                color: HexColor(colorRating[index]),
                                                width: 1.w),
                                            shape: BoxShape.circle,
                                          ) ,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: SizedBox(
                                  width: 40.w,
                                  child: Text(
                                    widget.field.choices[index].translations[
                                            surveyFieldController.defaultTranslation.value]
                                        ?.helpText??"",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 4.w),
                                  ),
                                ),
                              )
                            ],
                          );
                        }),
                  ),
                ],
              );
            });
      }
    );
  }
}
