import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zonka_feedback/utils/image_constant.dart';

class EmotionRatingWidget extends StatefulWidget {
  const EmotionRatingWidget({super.key});

  @override
  State<EmotionRatingWidget> createState() => _EmotionRatingWidgetState();
}

class _EmotionRatingWidgetState extends State<EmotionRatingWidget> {
  @override
  Widget build(BuildContext context) {
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
}