import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/field_model.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_design_controller.dart';
import 'package:zonka_feedback/utils/image_constant.dart';

class HeartRatingWidget extends StatefulWidget {
  final Field field;
  const HeartRatingWidget({super.key, required this.field});

  @override
  State<HeartRatingWidget> createState() => _HeartRatingWidgetState();
}

class _HeartRatingWidgetState extends State<HeartRatingWidget> {
  final SurveyDesignFieldController surveyFieldController =
      Get.find<SurveyDesignFieldController>();
  String? choiceId;

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
    return FormField(validator: (value) {
      return null;
    }, builder: (context) {
      return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
          itemCount: widget.field.options.length,
          itemBuilder: (context, indexOption) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget
                          .field
                          .options[indexOption]
                          .translations![
                              surveyFieldController.defaultTranslation.value]
                          ?.name ??
                      '',
                ),
                SizedBox(
                  width: 10.h,
                ),
                Container(
                  height: 60.h,
                  // decoration: BoxDecoration(
                  //     border: Border.all(color: Colors.blueAccent)),
                  alignment: Alignment.center,
                  child: ListView.builder(
                      itemCount: widget.field.choices.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, indexChoice) {
                        return GestureDetector(
                          onTap: () {
                            _optionMap[widget.field.options[indexOption].id ??
                                ""] = indexChoice;
                            _choiceMap[widget.field.options[indexOption].id ??
                                    ""] =
                                widget.field.choices[indexChoice].id ?? "";
                  
                            setState(() {});
                          },
                          child: Container(
                                margin: EdgeInsets.all(2.w),
                                child: widget.field.iconType == 'svg'
                                    ? SvgPicture.asset(
                                        ImageConstant.outlinedHeart,
                                        color: _optionMap[widget
                                                        .field
                                                        .options[indexOption]
                                                        .id ??
                                                    ""]! <
                                                indexChoice
                                            ? Colors.black.withOpacity(0.3)
                                            : Colors.black,
                                        colorFilter:const ColorFilter.mode(
                                            Colors.red, BlendMode.srcIn),
                                        height: 40.h,
                                      )
                                    : SvgPicture.asset(
                                        ImageConstant.heartSvg,
                                        color: _optionMap[widget
                                                        .field
                                                        .options[indexOption]
                                                        .id ??
                                                    ""]! <
                                                indexChoice
                                            ? Colors.red.withOpacity(0.3)
                                            : Colors.red,
                                        height: 40.h,
                                      ),
                              ),
                        );
                      }),
                )
              ],
            );
          });
    });
  }
}
