import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/field_model.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_design_controller.dart';
import 'package:zonka_feedback/utils/hexcolor_util.dart';

class NpsWidget extends StatefulWidget {
  final Field field;
  const NpsWidget({super.key, required this.field});

  @override
  State<NpsWidget> createState() => _NpsWidgetState();
}

class _NpsWidgetState extends State<NpsWidget> {
  int selected = -1;
   final SurveyDesignFieldController surveyFieldController = Get.find<SurveyDesignFieldController>();
   List gradientColors = [
     HexColor('#FF7574'),
     HexColor('#F9BE00'),
     HexColor('#76CE1E'),
  ];
  String ? choiceId;
  Color selectedColor = HexColor('#F9BE00');

  @override
  void initState() {
    print('NPSWidget ${widget.field.isButtonColored}');
    super.initState();
  }

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
              choiceId = widget.field.choices[index].id??"";
              setState(() {});
            },
            child: Container(
                margin: EdgeInsets.all(5.h),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: widget.field.isButtonColored??false ? Colors.transparent: Colors.black),     
                    color: widget.field.isButtonColored??false ?  choiceId !=null &&  choiceId != widget.field.choices[index].id? selectedColor.withOpacity(0.4): choiceId == widget.field.choices[index].id ? selectedColor : index>=0 && index<=6? gradientColors[0]: index>=7 && index<=8? gradientColors[1]: gradientColors[2]:  choiceId!=null && choiceId == widget.field.choices[index].id? Colors.black : Colors.grey.shade300  ,
                    borderRadius: BorderRadius.circular(5.r)),
                child: Text(widget.field.choices[index].translations[surveyFieldController.defaultTranslation.value]?.name??'',
                  style: TextStyle(color: widget.field.isButtonColored??false ? Colors.white : choiceId!=null && choiceId == widget.field.choices[index].id ? Colors.white: Colors.black),
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
