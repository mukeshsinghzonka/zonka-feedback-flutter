import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return FormField(
      validator: (value) {
        
      },
      builder: (context) {
        return Container(
        
          child: ListView(
            children: [
              Container(
                height: 50,
                width: 50,
                child: SvgPicture.asset(ImageConstant.emojiStaisfied))
            ],
          ),
        );
      }
    );
  }
}