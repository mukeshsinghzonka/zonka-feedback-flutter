import 'package:flutter/material.dart';

import 'package:zonka_feedback/feedback/data/data_model_new/field_model.dart';

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
         return null;
      },
      builder: (context) {
        return Container(
          child: Text('Emotion Rating Widget'),
        );
      }
    );
  }
}