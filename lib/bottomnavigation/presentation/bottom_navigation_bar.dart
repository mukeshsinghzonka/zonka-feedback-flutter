import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';
import 'package:zonka_feedback/bottomnavigation/presentation/manager/update_survey_controller.dart';
import 'package:zonka_feedback/services/workmanager_functions/work_manager_service.dart';
import 'package:zonka_feedback/utils/color_constant.dart';
import 'package:zonka_feedback/utils/constant_size.dart';
import 'package:zonka_feedback/utils/image_constant.dart';

import '../../utils/hive_directory_util.dart';
import '../../utils/hive_key.dart';


  class BottomNavigationBarWidget extends StatefulWidget {
    const BottomNavigationBarWidget({super.key});
  
    @override
    State<BottomNavigationBarWidget> createState() => _BottomNavigationBarState();
  }
  
  class _BottomNavigationBarState extends State<BottomNavigationBarWidget> {
    final  updateController = Get.put(UpdateSurveyController());
    @override
    Widget build(BuildContext context) {
     return Container(
        height: 60.h,
        margin: EdgeInsets.only(left: 10.w, right: 10.w),

        decoration: const BoxDecoration(
            color: Color(ColorConstant.bottomSheetBackgroundColor),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
   
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () async {
                    await updateController.call();
                },
                child: Container(
                  padding: EdgeInsets.all(2.w),
                  margin: EdgeInsets.only(top: 7.h , bottom: 8.h, right: 3.w,left: 10.w),
                  decoration: const BoxDecoration(
                      color: Color(ColorConstant.themeColor),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Row(

                    children: [
                       SizedBox(
                        width: 7.w,
                      ),
                      SvgPicture.asset(ImageConstant.updateCloudIcons),
                      SizedBox(
                        width: 10.w,
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Container(
                               alignment:Alignment.centerLeft,
                                  child: Text(
                                    'Update Survey',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: ConstantSize.small_2.sp),
                                  ),
                                ),
                              ),

                              Expanded(
                                child: ValueListenableBuilder(
                                    valueListenable: Hive.box(HiveDirectoryUtil.surveyLastUpdateDateTime).listenable(),
                                    builder: (context,  Box<dynamic> box, _) {
                                      var surveyCount = box.get(HiveKey.surveyLastUpdateKey);
                                   return
                                      Builder(
                                        builder: (context) {
                                        if(surveyCount == null){
                                          return Container();
                                        }
                                          return Text(
                                            'Last Update on ${DateFormat('dd MMM yyyy').format(surveyCount.surveyUpdateDateTime)}',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: ConstantSize.extra_small_3.sp,
                                            ),
                                          );
                                        }
                                      );
                                    }
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  WorkManagerService().startWorkManager();
                },
                child: Container(
                     height: 45.h,
                  padding: EdgeInsets.all(3.w),
                   margin: EdgeInsets.only(top: 7.h , bottom: 8.h, right: 3.w,left: 10.w),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: SvgPicture.asset(
                          ImageConstant.syncServerIcons,
                        ),
                      ),
                      SizedBox(width: 10.w,),
                      Expanded(
                        flex: 3,
                        child: Text(
                          'Sync with Server',
                          style: TextStyle(color: Colors.black,fontSize: ConstantSize.small_2.sp),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }
  }


