import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:zonka_feedback/template/presentation/manager/get_template_manager.dart';
import 'package:zonka_feedback/utils/color_constant.dart';
import 'package:zonka_feedback/utils/image_constant.dart';

class AddTemplateScreen extends StatefulWidget {
  const AddTemplateScreen({super.key});

  @override
  State<AddTemplateScreen> createState() => _AddTemplateScreenState();
}

class _AddTemplateScreenState extends State<AddTemplateScreen> {
  final getTemplateManager = Get.put(GetTemplateManager());

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
            // pinned: true,
            backgroundColor:const  Color(ColorConstant.themeColor),
            titleTextStyle: TextStyle(color: Colors.white, fontSize: 15.sp),
          ),
          SliverPersistentHeader(
            delegate: _PinnedHeaderDelegate(),
            pinned: true,
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
                                 decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color(ColorConstant.themeColor),
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
                                        
                                           decoration: BoxDecoration(
                             color: Colors.red,
                                borderRadius: const BorderRadius.only(
                                  topLeft:Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                              ),
                                          width: double.infinity,
                                          child: SvgPicture.asset(
                                              ImageConstant.zonkaDrawerLogo),
                                        )),

                                        SizedBox(
                                          height: 5.h,
                                        ),
                                    Expanded(
                                        flex: 4,
                                        child:  Container(
                                          child: const Column(
                                            children: [
                                              Expanded(
                                                  child: Text('5 Star Survey',style: TextStyle(
                                                    fontWeight: FontWeight.bold
                                                  ),)),
                                              Expanded(
                                                child: Row(
                                                  children: [
                                                    Expanded(
                                                      child: Column(
                                                        children: [
                                                          Text('2'),
                                                          Text('Questions')
                                                        ],
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Column(
                                                        children: [
                                                          Text('1 min 30 sec'),
                                                          Text('tocomplete')
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ))
                                  ],
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

// class _PinnedHeaderDelegate extends SliverPersistentHeaderDelegate {
//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return Container(
//       height: 60,
//       // color: Colors.grey,
//       margin: EdgeInsets.only(top: 10.h, left: 5.w, right: 5.w),
//       child: TextFormField(
//         // controller: _surveySearchController.searchSurveyController,
//         onChanged: (value) {
//           // _surveySearchController.filterSurveySearchList();
//         },
//         decoration: InputDecoration(
//           fillColor: Color(ColorConstant.searchBarColor),
//           prefixIcon: Icon(Icons.search),
//           hintText: 'Search Templates',
//           hintStyle:
//               TextStyle(color: Colors.grey, fontSize: ConstantSize.small_2),
//           isDense: true,
//           filled: true,
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(ConstantSize.small_1),
//             borderSide: BorderSide(color: Colors.transparent),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(ConstantSize.small_1),
//             borderSide: BorderSide(color: Colors.transparent),
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   double get maxExtent => 60; // Height of the pinned widget

//   @override
//   double get minExtent => 60; // Height of the pinned widget

//   @override
//   bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
//     return false;
//   }
// }




class _PinnedHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      height: 80,
       color: const Color(ColorConstant.signUpBackgroudColor),
      padding: EdgeInsets.only(left: 12.h, right: 12.h, top: 30.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    const  Text('Browse Template'),
                      GestureDetector(
                          onTap: () {},
                          child: Icon(Icons.add_circle_outline_sharp))
                    ],
                  ),
                 const Text('Choose from expert survey templates for different industries and use cases.'),
                  
                ],
              ),
            
    );
  }

  @override
  double get maxExtent => 100; // Height of the pinned widget

  @override
  double get minExtent => 100; // Height of the pinned widget

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
