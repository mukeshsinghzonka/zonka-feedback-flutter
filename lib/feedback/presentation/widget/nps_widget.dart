import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NpsWidget extends StatefulWidget {
  const NpsWidget({super.key});

  @override
  State<NpsWidget> createState() => _NpsWidgetState();
}

class _NpsWidgetState extends State<NpsWidget> {

  int  selected = -1;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () =>  setState(() {
            selected = index;
          }),
          child: Center(
            child: Container(
              height: 40,
              width: 40,
              margin: EdgeInsets.all(4.w),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: selected==index?Colors.black: Colors.grey.shade300,
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