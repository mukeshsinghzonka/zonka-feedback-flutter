import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:zonka_feedback/utils/color_constant.dart';
import 'package:zonka_feedback/utils/constant_size.dart';

class SurveyWidget extends StatelessWidget {
  const SurveyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 10.h, left: 13.w, right: 13.w),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(15.h)),
            border: Border.all(color: Colors.grey.shade400)),
        child: Container(
          height: 115.h,
          width: 328.w,
          padding:
              EdgeInsets.only(left: 10.w, right: 10.w, top: 10.w, bottom: 10.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'General Website Feedback',
                    style: TextStyle(
                        fontSize: ConstantSize.medium_2.sp,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 90.w,
                    height: 20.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20.w)),
                      color: const Color(ColorConstant.kisokColor),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 5.h,
                          width: 5.h,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 5.w),
                        Text(
                          'Kisok Mode',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: ConstantSize.small_1.sp),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                   Row(
                      children: [
                        Text(
                          '0 Response Today',
                          style: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: ConstantSize.small_2),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text('0 Unsynced Response',
                            style: TextStyle(
                                color: Colors.grey.shade400,
                                fontSize: ConstantSize.small_2)),
                      ],
                    ),
                  
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                      'Last Synced ${DateFormat.jm().format(DateTime.now())} ${DateFormat.yMMMEd().format(DateTime.now())}',
                      style: TextStyle(
                          color: Colors.grey.shade400,
                          fontSize: ConstantSize.small_2))
                ],
              ),
              Container(
                padding: EdgeInsets.all(5.h),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        width: 2.w,
                        color: Color(
                          ColorConstant.arrowForwardColor,
                        ))),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Color(ColorConstant.arrowForwardColor),
                ),
              )
            ],
          ),
        ));
  }
}
