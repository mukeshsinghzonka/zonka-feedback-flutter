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
          Container(
            margin: EdgeInsets.all(5.w),
            child: Row(
              children: [
                Container(
                  width: 50.w,
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(2.w),
                  child: Text("${widget.field.options[i].translations![surveyFieldController.defaultTranslation.value]?.name}",
                  style: TextStyle(
                      fontSize: 10.h
                  ),
                  ),
                ),
                for(int j = 0 ; j < colIndx - 1; j++)
                Expanded(
                  child:  GestureDetector(
                                    onTap: () {
                                      _optionMap[widget.field.options[i].id ?? ""] = j;
                                      _choiceMap[widget.field.options[i].id ?? ""] = widget.field.choices[j].id ?? "";
                                      setState(() {});
                                    },
                                    child: Container(
                                      width: 30.w,
                                      height: 30.h,
                                    margin: EdgeInsets.symmetric(horizontal: 5.w),
            
                                      decoration: widget.field.iconType == 'emoji'
                                          ? BoxDecoration(
                                              color: HexColor(colorRating[j]),
                                              shape: BoxShape.circle,
                                            )
                                          :_choiceMap[widget.field.options[i].id ??""]== widget.field.choices[j].id?BoxDecoration(
                                              color: HexColor(colorRating[j]),
                                              shape: BoxShape.circle,
                                            ): BoxDecoration(
                                              border: Border.all(
                                                  color: HexColor(colorRating[j]),
                                                  width: 1.w),
                                              shape: BoxShape.circle,
                                            ) ,
                                    ),
                                  )
                ),
              ],
            ),
          ),
          
        ],
      )
    );
  }
  }


