import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/survey_screen_model.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survery_feedback_controller.dart';
import 'package:zonka_feedback/feedback/presentation/screens/feedback_survey_screen.dart';
import 'package:zonka_feedback/surveys/data/data_model/survey_res_model.dart';
import 'package:zonka_feedback/utils/color_constant.dart';
import 'package:zonka_feedback/utils/constant_size.dart';

class SurveyWidget extends StatelessWidget {
  final SurveyResModel surveyResModel;
  SurveyWidget({super.key, required this.surveyResModel});
  final SurveryFeedbackController  _surveryFeedbackController = Get.put(SurveryFeedbackController());

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () async{
        await _surveryFeedbackController.call(surveyResModel.surveyId);
        SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]).then((value) => Navigator.push(context, MaterialPageRoute(builder: (context)=>SurveyScreen())));
      },
      child: Container(
          margin: EdgeInsets.only(top: 10.h, left: 13.w, right: 13.w),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(15.h)),
              border: Border.all(color: Colors.grey.shade400)),
          child: Container(
           
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
                 
                    Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 5.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(7.w)),
                          color:surveyResModel.iskioskmode?const Color(ColorConstant.kisokColor): const Color(ColorConstant.surveyModeColor),
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
                           surveyResModel.iskioskmode? 'Kisok Mode':   'Survey Mode',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: ConstantSize.extra_small_3.sp),
                            ),
                          ],
                        ),
                      ),
                 
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                '0 Response Today',
                                style: TextStyle(
                                    color: Colors.grey.shade400,
                                    fontSize: ConstantSize.extra_small_3.sp),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              Text('0 Unsynced Response',
                                  style: TextStyle(
                                      color: Colors.grey.shade400,
                                      fontSize: ConstantSize.extra_small_3.sp)),
                            ],
                          ),
                          Text(
                              'Last Synced ${DateFormat.jm().format(DateTime.now())} ${DateFormat.yMMMEd().format(DateTime.now())}',
                              style: TextStyle(
                                  color: Colors.grey.shade400,
                                  fontSize: ConstantSize.extra_small_3.sp))
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
          )),
    );
  }
}
