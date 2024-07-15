import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/field_model.dart';


class CsatButtonRating extends StatefulWidget {
  final Field field;
  const CsatButtonRating({super.key, required this.field});

  @override
  State<CsatButtonRating> createState() => _CsatButtonRatingState();
}

class _CsatButtonRatingState extends State<CsatButtonRating> {
  final List<String> _items = [
    "Strongly Disagree",
    "Disagree",
    "Neutral",
    "Agree",
    "Strongly Agree"
  ];
  int selected = -1;


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 70.h,
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
        ),
        child: ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: _items.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => setState(() {
                  selected = index;
                }) ,
                child: Container(
                  width: 50.w,
                  height: 40.h,
                  margin: const EdgeInsets.all(5),
                  padding: EdgeInsets.all(5.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.r)),
                    border: Border.all(color: Colors.black),
                    color:selected ==index? Colors.black: Colors.grey.shade300,
                  ),
                  child: Center(
                      child: Text(
                    _items[index],
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 5.sp, color: selected == index? Colors.white: Colors.black),
                  )),
                ),
              );
            }),
      ),
    );
  }
}
