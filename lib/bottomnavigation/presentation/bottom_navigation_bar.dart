import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zonka_feedback/utils/color_constant.dart';
import 'package:zonka_feedback/utils/constant_size.dart';
import 'package:zonka_feedback/utils/image_constant.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 55.h,
        margin: EdgeInsets.only(left: 10.w, right: 10.w,bottom: 10.h),
        decoration: const BoxDecoration(
            color: Color(ColorConstant.bottomSheetBackgroundColor),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 45.h,
                padding: EdgeInsets.all(4.w),
                margin: EdgeInsets.only(top: 7.h , bottom: 10.h, right: 3.w,left: 10.w),
                decoration: const BoxDecoration(
                    color: Color(ColorConstant.themeColor),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Row(
                  children: [
                    SvgPicture.asset(ImageConstant.updateCloudIcons),
                    SizedBox(
                      width: 10.w,
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: SizedBox(
                          height: 45.h,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Update Survey',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: ConstantSize.small_2.sp),
                              ),
                              Expanded(
                                child: Text(
                                  'Last Update on 30 Mar 2020',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: ConstantSize.small_1.sp),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                   height: 45.h,
                padding: EdgeInsets.all(5.w),
                margin: EdgeInsets.only(top: 8.h , bottom: 8.h, right: 5.w,left: 5.w),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      ImageConstant.syncServerIcons,
                    ),
                    SizedBox(width: 10.w,),
                    Text(
                      'Sync with Server',
                      style: TextStyle(color: Colors.black,fontSize: ConstantSize.small_2.sp),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    
  }
}