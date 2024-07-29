import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:zonka_feedback/feedback/data/data_model_new/field_model.dart';
import 'package:zonka_feedback/utils/image_constant.dart';

class EmotionRatingWidget extends StatefulWidget {
  final Field field;
  const EmotionRatingWidget({super.key, required this.field});

  @override
  State<EmotionRatingWidget> createState() => _EmotionRatingWidgetState();
}

class _EmotionRatingWidgetState extends State<EmotionRatingWidget> {
  List emojiConstant = [
    ImageConstant.emoji_1,
    ImageConstant.emoji_2,  
    ImageConstant.emoji_3,
    ImageConstant.emoji_4,
    ImageConstant.emoji_5,
  ];

  @override
  Widget build(BuildContext context) {
    return FormField(
      validator: (value) {
      return null;
    }, builder: (context) {
      return ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  height: 100.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
                  child: Column(
                    children: [
                     const Text('Heart Rating Widget'),
                      Container(
                        height: 50.h,
                        width: 100.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
                        child: ListView.builder(
                            itemCount: 5,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return SvgPicture.asset(emojiConstant[index]);
                            }),
                      )
                    ],
                  ),
                );
              });
    });
  }
}
