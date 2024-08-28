

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zonka_feedback/utils/color_constant.dart';
import 'package:zonka_feedback/utils/image_constant.dart';
typedef BoolCallback = void Function(bool val);


class PinnedHeaderDelegate extends SliverPersistentHeaderDelegate {
  late BoolCallback callbackFunction;
 PinnedHeaderDelegate({required this.callbackFunction});
 bool value = true;
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: 104,
      color: const Color(ColorConstant.signUpBackgroudColor),
      padding: EdgeInsets.only(left: 12.h, right: 12.h, top: 30.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Browse Templates',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.sp),),
              GestureDetector(
                onTap: () async {
              
                  callbackFunction(value);
                  value = !value;
                },
                child: SvgPicture.asset(ImageConstant.imageTemplateFilter),
              ),
            ],
          ),
          const Text('Choose from expert survey templates for different industries and use cases.'),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 104; // Height of the pinned widget

  @override
  double get minExtent => 104; // Height of the pinned widget

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
