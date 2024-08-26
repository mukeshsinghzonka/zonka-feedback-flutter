import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:zonka_feedback/template/presentation/manager/get_template_manager.dart';
import 'package:zonka_feedback/template/presentation/widget/pinned_header.dart';
import 'package:zonka_feedback/utils/color_constant.dart';
import 'package:zonka_feedback/utils/image_constant.dart';

class AddTemplateScreen extends StatefulWidget {
  const AddTemplateScreen({super.key});

  @override
  State<AddTemplateScreen> createState() => _AddTemplateScreenState();
}

class _AddTemplateScreenState extends State<AddTemplateScreen> {
  final getTemplateManager = Get.put(GetTemplateManager());
  bool backvalgroundColor = false;
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            title:  Text('Add Survey',style: TextStyle(fontSize: 20.sp),),
            centerTitle: true,
            backgroundColor: const Color(ColorConstant.themeColor),
            titleTextStyle: TextStyle(color: Colors.white, fontSize: 15.sp),
          ),
          SliverPersistentHeader(
            delegate: PinnedHeaderDelegate(
              callbackFunction: (val) {
                setState(() {
                  backvalgroundColor=val;
                });
              },
            ),
            pinned: true,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Stack(
                  alignment:AlignmentDirectional.topEnd,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 12.h),
                    
                      child: Column(
             
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Popular Templates',
                            style: TextStyle(
                              fontSize: 10.sp,
                            ),
                          ),
                          GridView.builder(
                              shrinkWrap: true,
                              itemCount: 10,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 1.1,
                                      mainAxisSpacing: 13,
                                      crossAxisSpacing: 25),
                              itemBuilder: (context, i) {
                                return Card(
                                  elevation: 3,
                                  color: Colors.white,
                                  child: Container(
                                    padding: EdgeInsets.all(2.w),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: const Color(
                                            ColorConstant.themeColor),
                                        width:
                                            1, //                   <--- border width here
                                      ),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        Expanded(
                                            flex: 5,
                                            child: Container(
                                              decoration: const BoxDecoration(
                                            
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  topRight: Radius.circular(10),
                                                ),
                                              ),
                                              width: double.infinity,
                                              child: SvgPicture.asset(
                                                  ImageConstant
                                                      .zonkaDrawerLogo),
                                            )),
                                        SizedBox(
                                          height: 5.h,
                                        ),
                                         Expanded(
                                          flex: 4,
                                          child: Column(
                                            children: [
                                              Expanded(
                                                  child: Text(
                                                '5 Star Survey',
                                                style: TextStyle(
                                                  fontSize: 10.sp,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )),
                                              Expanded(
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: Column(
                                                        children: [
                                                          Text('2',style: TextStyle(fontSize: 10.sp),),
                                                          Text('Questions',style: TextStyle(fontSize: 8.sp))
                                                        ],
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Column(
                                                        children: [
                                                          Text('1 min 30 sec', style: TextStyle(fontSize: 10.sp)),
                                                          Text('tocomplete', style: TextStyle(fontSize: 8.sp))
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ],
                      ),
                    ),
                   
                    Visibility(
                           visible:backvalgroundColor ,
                          child: Positioned.fill(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                              child: Container(
                                color: Colors.black.withOpacity(0.3), // Semi-transparent overlay
                              ),
                            ),
                          ),
                        ),
                     Visibility(
                      visible:backvalgroundColor ,
                       child: Builder(
                         builder: (context) {
                           return Container(
                            alignment: Alignment.topRight,
                            width: size.width * 0.5,
                            height: 200.h,color: Colors.red,);
                         }
                       ),
                     ),
                  ],
                );
              },
              childCount: 100,
            ),
          ),
        ],
      ),
    );
  }
}

