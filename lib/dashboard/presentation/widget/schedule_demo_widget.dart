import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kiosk_mode/kiosk_mode.dart';
import 'package:zonka_feedback/utils/color_constant.dart';
import 'package:zonka_feedback/utils/constant_size.dart';
import 'package:zonka_feedback/utils/image_constant.dart';

class ScheduleDemoWidget extends SliverPersistentHeaderDelegate {

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: 30.h,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                  stopKioskMode();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    ImageConstant.drawerHeadPhoneIcons,
                    width: ConstantSize.medium_2,
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  const Text(
                    "Schedule a Demo",
                    style: TextStyle(fontSize: ConstantSize.small_2),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 1.w,
            color: const Color(ColorConstant.themeColor),
          ),
          Expanded(
            child: Container(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      ImageConstant.drawerHelpIcon,
                      width: ConstantSize.medium_2,
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    const Text("Get Help",
                        style: TextStyle(fontSize: ConstantSize.small_2)),
                  ],
                )),
          ),
        ],
      ),
    );
  }
  
  @override
  double get maxExtent => 30.h;
  
  @override
  double get minExtent => 30.h;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
