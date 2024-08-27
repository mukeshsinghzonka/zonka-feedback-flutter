import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zonka_feedback/utils/color_constant.dart';

class TemplateBottomFeedback extends StatefulWidget {
  const TemplateBottomFeedback({super.key});

  @override
  State<TemplateBottomFeedback> createState() => _TemplateBottomFeedbackState();
}

class _TemplateBottomFeedbackState extends State<TemplateBottomFeedback> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Container(
              width: size.width * 0.4,
              padding: EdgeInsets.symmetric(vertical: 5.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border:
                      Border.all(color: const Color(ColorConstant.themeColor))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    size: 5.sp,
                    color: const Color(ColorConstant.themeColor),
                  ),
                  const Text(
                    'Back to Templates',
                    style: TextStyle(color: Color(ColorConstant.themeColor)),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 5.h),
            width: size.width * 0.4,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(ColorConstant.themeColor),
            ),
            child: Text(
              'Use this Template',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
