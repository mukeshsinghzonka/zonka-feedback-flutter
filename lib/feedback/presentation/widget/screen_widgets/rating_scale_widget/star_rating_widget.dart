import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/field_model.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_design_controller.dart';
import 'package:zonka_feedback/utils/hexcolor_util.dart';
import 'package:zonka_feedback/utils/image_constant.dart';

class StarRatingWidget extends StatefulWidget {
  final Field field;
  const StarRatingWidget({super.key, required this.field});

  @override
  State<StarRatingWidget> createState() => _StarRatingWidgetState();
}

class _StarRatingWidgetState extends State<StarRatingWidget> with SingleTickerProviderStateMixin{

   final SurveyDesignFieldController surveyFieldController =
      Get.find<SurveyDesignFieldController>();
  String? choiceId;

  Map<String, String> _choiceMap = {};
  Map<String, int> _optionMap = {};

 late AnimationController _controller;
  late Animation<double> _animation;


  @override
  void initState() {


    for (int i = 0; i < widget.field.options.length; i++) {
      _optionMap[widget.field.options[i].id ?? ""] = -1;
    }

    for (int i = 0; i < widget.field.options.length; i++) {
      _choiceMap[widget.field.options[i].id ?? ""] = "";
    }

  _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

     _animation = Tween<double>(begin: 1.0, end: 0.0).animate(_controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      });


    super.initState();
  }
  
   void _onTap() {
    _controller.forward();
  }


  @override
  Widget build(BuildContext context) {
    return FormField(
      validator: (value) {
      return null;
    }, builder: (context) {
      return ListView.builder(
            shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
          itemCount: widget.field.options.length,
          itemBuilder: (context, indexOption) {
            return Container(
              margin: EdgeInsets.all(5.w),
              child: Column(
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
                    height: 5.h,
                  ),
                  Container(
                    height: 80.h,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent)),
                    alignment: Alignment.center,
                    child: ListView.builder(
                        itemCount: widget.field.choices.length,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, indexChoice) {
                          return Column(
                            children: [
                              Expanded(
                                flex: 3,
                                child: GestureDetector(
                                  onTap: () {
                                    _optionMap[widget.field.options[indexOption].id ??
                                        ""] = indexChoice;
                                    _choiceMap[widget.field.options[indexOption].id ??
                                            ""] =
                                        widget.field.choices[indexChoice].id ?? "";
                                        _onTap();
                                    setState(() {});
                                  },
                                  child: AnimatedBuilder(
                                    animation: _animation,
                                    builder: (context,child) {
                                      return Opacity(
                                        opacity: _animation.value,
                                        child: SvgPicture.asset(
                                            ImageConstant.starSvg,
                                            color:
                                                _optionMap[widget.field.options[indexOption]
                                                                .id ??
                                                            ""]! <
                                                        indexChoice
                                                    ? HexColor('#FFD93B').withOpacity(0.3)
                                                    :  HexColor('#FFD93B'),
                                            height: 40.h,
                                          ),
                                      );
                                    }
                                  ),
                                  
                                ),
                              ),
                              Expanded(
                                child: SizedBox(
                              width: 30.w,
                              child: Text(
                                textAlign: TextAlign.center,
                                "yugguhkjhkj" ?? "yugguhkjhkj",)))
                            ],
                          );
                        }),
                  )
                ],
              ),
            );
          });
    });
    
  }
}
