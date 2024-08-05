import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/field_model.dart';
import 'package:zonka_feedback/feedback/presentation/manager/blinking_animation_controller.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_design_controller.dart';
import 'package:zonka_feedback/utils/hexcolor_util.dart';
import 'package:zonka_feedback/utils/image_constant.dart';


class StarRatingWidget extends StatefulWidget {
  final Field field;
  const StarRatingWidget({super.key,required this.field});

  @override
  State<StarRatingWidget> createState() => _StarRatingWidgetState();
}

class _StarRatingWidgetState extends State<StarRatingWidget>with SingleTickerProviderStateMixin {
  final SurveyDesignFieldController surveyFieldController = Get.find<SurveyDesignFieldController>();
  final BlinkingAnimmationController _animationController = BlinkingAnimmationController();
  String optionId = "";
  Map<String, String> _choiceMap = {};
  Map<String, int> _optionMap = {};

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
    _animationController.initAnimationController(this);
   
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
            for(int j = 0 ; j < colIndx ; j++)
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(2.w),
                  child: Text("${widget.field.choices[j].translations[surveyFieldController.defaultTranslation.value]?.helpText}",
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
              Visibility(
                visible: widget.field.options[i].translations![surveyFieldController.defaultTranslation.value]?.name!="",
                child: Container(
                  width: 50.w,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(2.w),
                  child: Text("${widget.field.options[i].translations![surveyFieldController.defaultTranslation.value]?.name}",
                  style: TextStyle(
                      fontSize: 10.h
                  ),
                  ),
                ),
              ),
              for(int j = 0 ; j < colIndx; j++)
              Expanded(
                child: GestureDetector(
                            onTap: () async {
                              _optionMap[widget.field.options[i].id ??
                                  ""] = j;
                              _choiceMap[widget.field.options[i].id ??
                                      ""] =
                                  widget.field.choices[j].id ?? "";
                                  optionId = widget.field.options[i].id ?? "";
                                for(int i = 0 ;i<2;i++){
                                await _animationController.blinkingAnimation();         
                              setState(() {});
                  }
                              
                            },
                            child: AnimatedBuilder(
                              animation: _animationController.animation,
                              builder: (context,child) {
                                return Opacity(
                                  opacity:_optionMap[widget.field.options[i].id ?? ""]! >= j && optionId==widget.field.options[i].id  ?_animationController.animation.value:1  ,
                                  child: Container(
                                    margin: EdgeInsets.all(3.w),
                                    child: SvgPicture.asset(
                                      ImageConstant.starSvg,
                                      color: _optionMap[widget.field.options[i].id ?? ""]! >= j || _optionMap[widget.field.options[i].id ?? ""]==-1
                                          ? HexColor('#FFD93B') :HexColor('#FFD93B').withOpacity(0.3)
                                          ,
                                      height: 30.h,
                                    ),
                                  ),
                                );
                              }
                            ),
                          )
              ),
            ],
          ),
          
        ],
      )
    );
  }
}

