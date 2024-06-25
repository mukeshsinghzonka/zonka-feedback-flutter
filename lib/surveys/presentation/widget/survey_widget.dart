import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:zonka_feedback/surveys/data/data_model/survey_res_model.dart';
import 'package:zonka_feedback/utils/color_constant.dart';
import 'package:zonka_feedback/utils/constant_size.dart';

class SurveyWidget extends StatelessWidget {
  final SurveyResModel surveyResModel;
  const SurveyWidget({super.key, required this.surveyResModel});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 10.h, left: 13.w, right: 13.w),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(15.h)),
            border: Border.all(color: Colors.grey.shade400)),
        child: Container(
          height: 100.h,
          width: 328.w,
          padding: EdgeInsets.only(
            left: 10.w,
            right: 10.w,
            top: 10.h,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    surveyResModel.surveyName,
                    style: TextStyle(
                        fontSize: ConstantSize.small_2.sp,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Builder(builder: (context) {
                    if (surveyResModel.iskioskmode) {
                      return Container(
                      alignment: Alignment.center,
                      width: 80.w,
                      height: 20.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.w)),
                        color: const Color(ColorConstant.surveyModeColor),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 3.h,
                            width: 3.h,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            'Survey Mode',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: ConstantSize.extra_small_3.sp),
                          ),
                        ],
                      ),
                    );
                    }
                    return Container(
                      alignment: Alignment.center,
                      width: 80.w,
                      height: 20.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.w)),
                        color: const Color(ColorConstant.kisokColor),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 3.h,
                            width: 3.h,
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
                                fontSize: ConstantSize.extra_small_3.sp),
                          ),
                        ],
                      ),
                    );
                  }),
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    height: 30.h,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              '0 Response Today',
                              style: TextStyle(
                                  color: Colors.grey.shade400,
                                  fontSize: ConstantSize.small_1.sp),
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text('0 Unsynced Response',
                                style: TextStyle(
                                    color: Colors.grey.shade400,
                                    fontSize: ConstantSize.small_1.sp)),
                          ],
                        ),
                        Text(
                            'Last Synced ${DateFormat.jm().format(DateTime.now())} ${DateFormat.yMMMEd().format(DateTime.now())}',
                            style: TextStyle(
                                color: Colors.grey.shade400,
                                fontSize: ConstantSize.small_1.sp))
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(5.h),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        width: 2.w,
                        color: const Color(
                          ColorConstant.arrowForwardColor,
                        ))),
                child: const Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                  color: Color(ColorConstant.arrowForwardColor),
                ),
              )
            ],
          ),
        ));
  }
}
