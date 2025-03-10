

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zonka_feedback/utils/callback_function.dart';
import 'package:zonka_feedback/utils/color_constant.dart';
import 'package:zonka_feedback/utils/image_constant.dart';

class PinnedHeaderDelegate extends SliverPersistentHeaderDelegate {
  late BoolCallback callbackFunction;
 PinnedHeaderDelegate({required this.callbackFunction});
  bool showFilter = false;
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {

    return Container(
      height: 100.h,
      color: const Color(ColorConstant.signUpBackgroudColor),
      padding: EdgeInsets.only(left: 12.h, right: 12.h, top: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Browse Templates',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.sp),),
                GestureDetector(
                  onTap: () async {
                    showFilter = !showFilter;
                    callbackFunction(showFilter);
                  },
                  child: SvgPicture.asset(
                    ImageConstant.imageTemplateFilter),
                  // child:Icon(Icons.add)
                ),
              ],
            ),
          ),
           Text('Choose from expert survey templates for different industries and use cases.',style: TextStyle(fontSize: 10.sp),),
    
  
            ],
      ),
    );
  }

  @override
  double get maxExtent => 100.h; // Height of the pinned widget

  @override
  double get minExtent => 100.h; // Height of the pinned widget

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
