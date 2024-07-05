

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScaleRatingWidget extends StatefulWidget {
  const ScaleRatingWidget({super.key});

  @override
  State<ScaleRatingWidget> createState() => _ScaleRatingWidgetState();
}

class _ScaleRatingWidgetState extends State<ScaleRatingWidget> {
  int  selected = -1;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: ListView.builder(
        itemCount: 11,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () =>  setState(() {
            selected = index;
          }),
          child: Center(
            child: Container(
              height: 40.h,
              width: 18.w,
              margin: EdgeInsets.all(4.w),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: selected==index ?Colors.black: Colors.grey.shade300,
                border: Border.all(color: Colors.black),
                  borderRadius:const  BorderRadius.all(
                  Radius.circular(10)
                  ),
                ),
              child: Text(index.toString(),
              style: TextStyle(
                color: selected==index?Colors.white: Colors.black,
              ),),
            ),
          ),
        );
      }),
    );
  }
}