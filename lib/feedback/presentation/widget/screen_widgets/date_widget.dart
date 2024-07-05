import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:zonka_feedback/utils/color_constant.dart';

class DateWidget extends StatefulWidget {
  const DateWidget({super.key});

  @override
  State<DateWidget> createState() => _DateWidgetState();
}

class _DateWidgetState extends State<DateWidget> {

  DateTime ? selectedDate;
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: 
      () async {
       selectedDate = await showDatePicker(
          context: context,
          initialDate: selectedDate ?? DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2025),
        );
        setState(() {});
      },
      child: Container(
          width: 150.w,
          padding: EdgeInsets.all(5.w),
          decoration: BoxDecoration(
            color: Color(ColorConstant.surveyInputColor),
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Row(
           children: [
             selectedDate!=null?Text(formatter.format(selectedDate!)) : const  Text('YYYY-MM-DD'),
              const Spacer(),
              Icon(
                Icons.calendar_today,
                size: 10.sp,
              )
            ],
          )),
    );
  }
}
