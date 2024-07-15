import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/field_model.dart';

class WelcomeWidget extends StatefulWidget {
  final Field field;
  const WelcomeWidget({super.key, required this.field});

  @override
  State<WelcomeWidget> createState() => _WelcomeWidgetState();
}

class _WelcomeWidgetState extends State<WelcomeWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 40.h,
        width: 80.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10.r),
          color: Colors.black,
        ),
        child: const Text('Get Started', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
