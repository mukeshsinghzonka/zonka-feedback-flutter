import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:zonka_feedback/feedback/presentation/screens/setting_up_screen.dart';
import 'package:zonka_feedback/surveys/data/data_model/survey_res_model.dart';
import 'package:zonka_feedback/surveys/domain/entity/survey_count_response.dart';
import 'package:zonka_feedback/surveys/presentation/manager/survey_time_unsync_controller.dart';
import 'package:zonka_feedback/utils/color_constant.dart';
import 'package:zonka_feedback/utils/constant_size.dart';
import 'package:zonka_feedback/utils/enum_util.dart';
import 'package:zonka_feedback/utils/hive_directory_util.dart';

class SurveyWidget extends StatefulWidget {
  final SurveyResModel surveyResModel;
  const SurveyWidget({super.key, required this.surveyResModel});

  @override
  State<SurveyWidget> createState() => _SurveyWidgetState();
}

class _SurveyWidgetState extends State<SurveyWidget> with TickerProviderStateMixin {

   
 final surveyController = Get.find<SurveyTimeUnsyncController>();


  @override
  Widget build(BuildContext context) {

    return Card(
        margin: EdgeInsets.only(top: 10.h, left: 13.w, right: 13.w),
        color: Colors.white,
        child: InkWell(
          borderRadius: BorderRadius.circular(7.w),
          splashColor: const Color(ColorConstant.appBarBottomColor),
          onTap: () async {
            Navigator.push(
                context,
                PageRouteBuilder(
                  transitionDuration: const Duration(milliseconds: 1),
                  pageBuilder: (BuildContext context,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation) {
                    return SettingUpscreen(
                      screenBottom: SuveryScreenBottom.exitBottomBar,
                      surveyId: widget.surveyResModel.surveyId,
                    );
                  },
                ));
          },
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
                      widget.surveyResModel.surveyName,
                      style: TextStyle(
                          fontSize: ConstantSize.small_2.sp,
                          fontWeight: FontWeight.w400),
                    ),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(7.w)),
                        color: widget.surveyResModel.iskioskmode
                            ? const Color(ColorConstant.kisokColor)
                            : const Color(ColorConstant.surveyModeColor),
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
                            widget.surveyResModel.iskioskmode
                                ? 'Kiosk Mode'
                                : 'Survey Mode',
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
                              ValueListenableBuilder(
                                valueListenable: Hive.box(HiveDirectoryUtil.totalSurveySubmitResponse).listenable(),
                                builder: (context, Box<dynamic> box, _) {
                                  // Fetch the count using the surveyId (or another unique key)
                                  final surveyId = widget.surveyResModel.surveyId;
                                  var surveyCount = box.get(surveyId,defaultValue: SurveyCountResponseData(count: 0, dateTime: DateTime.now()));

                                  return Text(
                                    '${surveyCount.count} Response Today',
                                    style: TextStyle(
                                      color: Colors.grey.shade400,
                                      fontSize: ConstantSize.extra_small_3.sp,
                                    ),
                                  );
                                },
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              ValueListenableBuilder(
                                valueListenable: Hive.box(HiveDirectoryUtil.submitSurveyBox).listenable(),
                                builder: (context, Box<dynamic> box, _) {
                                  // Retrieve the values and cast them to List<SurveySubmitModel>
                                  List<dynamic> surveySubmitModel = box.values.toList();
                                  // print("HiveDirectoryUtilsubmitSurveyBox ${ box.values.toList()}");
                                  // Filter the list based on the surveyId and count the matching items
                                
                                  int count = surveySubmitModel.where((e) => e.surveyId.toString() == widget.surveyResModel.surveyId).length;
                                  // Since the list is never null, we just check the count
                                  return Text(
                                    'Unsynced Response: $count',
                                    style: TextStyle(
                                      color: Colors.grey.shade400,
                                      fontSize: ConstantSize.extra_small_3.sp,
                                    ),
                                  );
                                },
                                child: Text(
                                  'Unsynced Response: 0',
                                  style: TextStyle(
                                    color: Colors.grey.shade400,
                                    fontSize: ConstantSize.extra_small_3.sp,
                                  ),
                                ),
                              ),
                            ],
                          ),
                           GetBuilder<SurveyTimeUnsyncController>(
  init: surveyController,
  builder: (controller) {
    print("Survey ID: ${widget.surveyResModel.surveyId}");
    print("Last Sync Times: ${controller.surveyLastSyncTime}");
    print("Last Sync Time for Survey: ${controller.surveyLastSyncTime[widget.surveyResModel.surveyId]}");

    // Safely check if the survey ID exists in the map
    DateTime? lastSyncTime = controller.surveyLastSyncTime[widget.surveyResModel.surveyId];
    return Text(lastSyncTime != null ? lastSyncTime.toString() : 'No sync time available',
      style: TextStyle(
        color: Colors.grey.shade400,
        fontSize: ConstantSize.extra_small_3.sp,
      ),
    );
  },
)

                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(10.h),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          width: 1.w,
                          color: const Color(ColorConstant.themeColor))),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 15.sp,
                    color: const Color(ColorConstant.themeColor),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
