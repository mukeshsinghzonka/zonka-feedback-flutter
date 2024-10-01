import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:zonka_feedback/feedback/presentation/screens/setting_up_screen.dart';
import 'package:zonka_feedback/surveys/data/data_model/survey_res_model.dart';
import 'package:zonka_feedback/surveys/domain/entity/survey_count_response.dart';
import 'package:zonka_feedback/surveys/presentation/manager/survey_time_unsync_controller.dart';
import 'package:zonka_feedback/surveys/presentation/widget/preview_mode_on_dialog_box.dart';
import 'package:zonka_feedback/utils/color_constant.dart';
import 'package:zonka_feedback/utils/constant_size.dart';
import 'package:zonka_feedback/utils/enum_util.dart';
import 'package:zonka_feedback/utils/hive_directory_util.dart';

import '../../../utils/global_value_notifier.dart';

class SurveyWidget extends StatefulWidget {
  final SurveyResModel surveyResModel;

  const SurveyWidget({super.key, required this.surveyResModel});

  @override
  State<SurveyWidget> createState() => _SurveyWidgetState();
}

class _SurveyWidgetState extends State<SurveyWidget>
    with TickerProviderStateMixin {
  final surveyController = Get.find<SurveyTimeUnsyncController>();

  @override
  void initState() {
    super.initState();
  }

  void pushToSurveyScreen() {
    Navigator.push(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 1),
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return SettingUpscreen(
              screenBottom: SuveryScreenBottom.exitBottomBar,
              surveyId: widget.surveyResModel.surveyId,
            );
          },
        ));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
        margin: EdgeInsets.symmetric(vertical: 8.h,horizontal:10.h),
        color: Colors.white,
        child: InkWell(
          borderRadius: BorderRadius.circular(7.w),
          splashColor: const Color(ColorConstant.appBarBottomColor),
          onTap: () async {
            if (isPreviewModeOn.value == true) {
              showDialog(
                  context: context,
                  builder: (_) {
                    return const Dialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: PreviewModeOnDialogBox(),
                    );
                  }).then((value) {
                if (value == true) {
                  pushToSurveyScreen();
                }
              });
            } else {
              pushToSurveyScreen();
            }
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 5.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.surveyResModel.surveyName,
                        style: TextStyle(
                            fontSize: ConstantSize.medium_1.sp,
                            fontWeight: FontWeight.w400),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width:size.width/5,
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
                                  fontSize: ConstantSize.extra_small_2.sp),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 5.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width:size.width/2.5,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: ValueListenableBuilder(
                                      valueListenable: Hive.box(HiveDirectoryUtil.totalSurveyResponseCount).listenable(),
                                      builder: (context, Box<dynamic> box, _) {
                                        // Retrieve the values and cast them to List<SurveySubmitModel>
                                        final surveyId = widget.surveyResModel.surveyId;
                                        var surveyCount = box.get(surveyId);
                                        // Since the list is never null, we just check the count
                                        return Text(
                                          '${surveyCount ?? 0} Response Today ',
                                          style: TextStyle(
                                            color: Colors.grey.shade400,
                                            fontSize: ConstantSize.extra_small_3.sp,
                                          ),
                                        );
                                      },
                                      child: Text(
                                        '0 Response Today',
                                        style: TextStyle(
                                          color: Colors.grey.shade400,
                                          fontSize: ConstantSize.extra_small_3.sp,
                                        ),
                                      ),
                                    ),
                                  ),

                                  Expanded(
                                    child: ValueListenableBuilder(
                                      valueListenable: Hive.box(HiveDirectoryUtil.surveyUnsyncResponseCount).listenable(),
                                      builder: (context, Box<dynamic> box, _) {
                                        // Fetch the count using the surveyId (or another unique key)
                                        final surveyId = widget.surveyResModel.surveyId;
                                        var surveyCount = box.get(surveyId);

                                        return Text(
                                          '${surveyCount ?? 0} To be synced',
                                          style: TextStyle(
                                            color: Colors.grey.shade400,
                                            fontSize: ConstantSize.extra_small_3.sp,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            ValueListenableBuilder(
                              valueListenable: Hive.box(HiveDirectoryUtil.surveyLastSyncDateTime).listenable(),
                              builder: (context, Box<dynamic> box, _) {
                                dynamic surveySubmitModel = box.get(widget.surveyResModel.surveyId);

                                // Define a DateTime format
                                String formattedDate;
                                if (surveySubmitModel != null) {
                                  try {
                                    // Convert surveySubmitModel to DateTime (assuming it's a String in the format "2024-09-25 3:40 PM")
                                    DateTime parsedDate = DateFormat("yyyy-MM-dd h:mm a").parse(surveySubmitModel);

                                    // Format the date into a more readable format
                                    formattedDate = DateFormat("MMMM dd, yyyy 'at' h:mm a").format(parsedDate);
                                  } catch (e) {
                                    formattedDate = "Invalid Date";
                                  }
                                } else {
                                  formattedDate = "Not Available";
                                }

                                return Text(
                                  'Last Synced $formattedDate',
                                  style: TextStyle(
                                    color: Colors.grey.shade400,
                                    fontSize: ConstantSize.extra_small_3.sp,
                                  ),
                                );
                              },
                              child: Text(
                                'Last Synced Not Available',
                                style: TextStyle(
                                  color: Colors.grey.shade400,
                                  fontSize: ConstantSize.extra_small_3.sp,
                                ),
                              ),
                            ),
                              //
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
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
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
