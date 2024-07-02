import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NpsWidget extends StatefulWidget {
  const NpsWidget({super.key});

  @override
  State<NpsWidget> createState() => _NpsWidgetState();
}

class _NpsWidgetState extends State<NpsWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 50.h,
        
        decoration: BoxDecoration(
    border: Border.all(color: Colors.blueAccent)
  ),
        child: ListView.builder(
          itemCount: 10,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
          return Center(
            child: Container(
              height: 30,
              width: 30,
              margin: EdgeInsets.all(4.w),
              
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                  borderRadius: BorderRadius.all(
                  Radius.circular(10),
                  
                  ),
                  
                ),
              child: Text(index.toString()),
            ),
          );
        }),
      ),
    );
  }
}