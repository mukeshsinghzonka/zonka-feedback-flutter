import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zonka_feedback/template/presentation/manager/get_template_manager.dart';
import 'package:zonka_feedback/utils/color_constant.dart';
import 'package:zonka_feedback/utils/constant_size.dart';

class AddTemplateScreen extends StatefulWidget {
  const AddTemplateScreen({super.key});

  @override
  State<AddTemplateScreen> createState() => _AddTemplateScreenState();
}

class _AddTemplateScreenState extends State<AddTemplateScreen> {


  final  getTemplateManager = Get.put(GetTemplateManager());

  @override
  void initState() {
    getTemplateManager.call();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text('Add Survey'),
            centerTitle: true,
            pinned: true,
            backgroundColor: Color(ColorConstant.themeColor),
            titleTextStyle: TextStyle(color: Colors.white, fontSize: 15.sp),
          ),
          SliverPersistentHeader(
            delegate: _PinnedHeaderDelegate(),
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 12.h, vertical: 15.h),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Browse Template'),
                      GestureDetector(
                        onTap: (){

                        },
                        child: Icon(Icons.add_circle_outline_sharp))
                    ],
                  )
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 12.h),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Popular Templates',
                        style: TextStyle(
                            fontSize: 10.sp, fontWeight: FontWeight.bold),
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
                            return Container(
                              height: 50.h,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                            );
                          }),
                    ],
                  ),
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

class _PinnedHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: 60,
      // color: Colors.grey,
      margin: EdgeInsets.only(top: 10.h, left: 5.w, right: 5.w),
      child: TextFormField(
        // controller: _surveySearchController.searchSurveyController,
        onChanged: (value) {
          // _surveySearchController.filterSurveySearchList();
        },
        decoration: InputDecoration(
          fillColor: Color(ColorConstant.searchBarColor),
          prefixIcon: Icon(Icons.search),
          hintText: 'Search Templates',
          hintStyle:
              TextStyle(color: Colors.grey, fontSize: ConstantSize.small_2),
          isDense: true,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(ConstantSize.small_1),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(ConstantSize.small_1),
            borderSide: BorderSide(color: Colors.transparent),
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => 60; // Height of the pinned widget

  @override
  double get minExtent => 60; // Height of the pinned widget

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
