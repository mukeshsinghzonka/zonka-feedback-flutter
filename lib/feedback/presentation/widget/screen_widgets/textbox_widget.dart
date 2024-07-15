import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zonka_feedback/utils/color_constant.dart';

class TextboxWidget extends StatefulWidget {
  const TextboxWidget({super.key});

  @override
  State<TextboxWidget> createState() => _TextboxWidgetState();
}

class _TextboxWidgetState extends State<TextboxWidget> {
  @override
  Widget build(BuildContext context) {
    return FormField(
      validator: (value) {
        print("kknee");
      },
      builder: (context) {
        return Container(
          width: 200.w,
          height: 50.h,
          alignment: Alignment.topCenter,
          child: TextFormField(
            decoration:  InputDecoration(
              filled: true,
              fillColor: const Color(ColorConstant.surveyInputColor),
              contentPadding: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 10.0),
              isDense: true,
              focusedBorder:  OutlineInputBorder(
                borderSide:const BorderSide(color: Colors.black, width: 1.0),
                  
                borderRadius: BorderRadius.circular(10.0)
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black, width: 1.0),
                  
                borderRadius: BorderRadius.circular(10.0)
              ),
              hintText: 'Enter Here',
              hintStyle: TextStyle(fontSize: 6.sp)
            ),
          )
        );
      }
    );
  }
}