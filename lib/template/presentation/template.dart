import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survery_api_feedback_controller.dart';
import 'package:zonka_feedback/feedback/presentation/screens/feedback_survey_screen.dart';
import 'package:zonka_feedback/services/api_call_handling.dart';
import 'package:zonka_feedback/template/data/data_model/template_industries_map.dart';
import 'package:zonka_feedback/template/data/data_model/template_model.dart';
import 'package:zonka_feedback/template/presentation/manager/get_template_manager.dart';
import 'package:zonka_feedback/template/presentation/widget/pinned_header.dart';
import 'package:zonka_feedback/template/presentation/widget/template_dialog.dart';
import 'package:zonka_feedback/utils/color_constant.dart';
import 'package:zonka_feedback/utils/enum_util.dart';

class AddTemplateScreen extends StatefulWidget {
  const AddTemplateScreen({super.key});
  
  get surveyResModel => null;

  @override
  State<AddTemplateScreen> createState() => _AddTemplateScreenState();
}

class _AddTemplateScreenState extends State<AddTemplateScreen> {
  final getTemplateManager = Get.put(GetTemplateManager());
  bool backvalgroundColor = false;
  final ScrollController _scrollController = ScrollController();
 final SurveryApiFeedbackController surveryFeedbackController =
      Get.put(SurveryApiFeedbackController());
  @override
  void initState() {
    getTemplateManager.call();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Obx(() {
        return CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              title: Text(
                'Add Survey',
                style: TextStyle(fontSize: 20.sp),
              ),
              centerTitle: true,
               iconTheme: const IconThemeData(
    color: Colors.white, // Change this to your desired color
  ),
              backgroundColor: const Color(ColorConstant.themeColor),
              titleTextStyle: TextStyle(color: Colors.white, fontSize: 15.sp),
            ),
            SliverPersistentHeader(
              delegate: PinnedHeaderDelegate(
                callbackFunction: (val) {
                  setState(() {
                    backvalgroundColor = val;
                  });
                },
              ),
              pinned: true,
            ),
            getTemplateManager.apiStatus.value == ApiCallStatus.Loading
                ? SliverToBoxAdapter(
                    child: Container(
                        width: 10.w,
                        height: size.height * 0.7,
                        alignment: Alignment.center,
                        child: const CircularProgressIndicator(
                          color: Color(ColorConstant.themeColor),
                        )),
                  )
                : SliverToBoxAdapter(
                    child: Stack(
                      alignment: AlignmentDirectional.topEnd,
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: getTemplateManager
                              .templateData.value.templateIndustriesMap.length,
                          itemBuilder: (BuildContext context, int index) {
                            List<TemplateIndustriesMap>
                                templateIndustriesMapValue = getTemplateManager
                                    .templateData.value.templateIndustriesMap;
                            return Container(
                              padding: EdgeInsets.symmetric(horizontal: 12.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Visibility(
                                    visible: getTemplateManager
                                            .filterTemplateIndustryMap[
                                                templateIndustriesMapValue[
                                                        index]
                                                    .id]
                                            ?.length !=
                                        0,
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          left: 5.w, top: 10.h, bottom: 5.h),
                                      child: Text(
                                        '${templateIndustriesMapValue[index].name}',
                                        style: TextStyle(
                                          fontSize: 10.sp,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                  GridView.builder(
                                    shrinkWrap: true,
                                    itemCount: getTemplateManager
                                            .filterTemplateIndustryMap[
                                                templateIndustriesMapValue[
                                                        index]
                                                    .id]
                                            ?.length ??
                                        0,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    padding: const EdgeInsets.all(0),
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 1,
                                      mainAxisSpacing: 13,
                                      crossAxisSpacing: 25,
                                    ),
                                    itemBuilder: (context, i) {
                                      TemplateModel templateModel =
                                          getTemplateManager
                                                  .filterTemplateIndustryMap[
                                              templateIndustriesMapValue[index]
                                                  .id]![i];
                                      return GestureDetector(
                                        onTap: () {

                                          showDialog(
        context: context,
        builder: (_) => PreviewTemplateDialogBox(
          templateModel: templateModel,
        ),
      ).then((value){
        if(value){
   ApiCallHandling(
                controller: surveryFeedbackController,
                status: ApiCallStatus.Initial,
                sendParams: true,
                success: () {
             
                  SystemChrome.setPreferredOrientations(
                          [DeviceOrientation.landscapeLeft])
                      .then((value) => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const SurveyScreenFeedbackPage())));
                }).handleApiCall(value:templateModel.surveyId?.id??"" );
        }
       
      });
                
                                       
                                       
                                       
                                        },
                                        child: Card(
                                          elevation: 3,
                                          color: Colors.white,
                                          child: Container(
                                            padding: EdgeInsets.all(2.w),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: const Color(
                                                    ColorConstant.themeColor),
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  const BorderRadius.all(
                                                Radius.circular(10),
                                              ),
                                            ),
                                            child: Column(
                                              children: [
                                                Expanded(
                                                  flex: 5,
                                                  child: Container(
                                                    decoration:
                                                        const BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(10),
                                                        topRight:
                                                            Radius.circular(10),
                                                      ),
                                                    ),
                                                    width: double.infinity,
                                                    child: CachedNetworkImage(
                                                      imageUrl: templateModel
                                                              .thumbnailImage ??
                                                          '',
                                                      errorWidget:
                                                          (context, url, error) {
                                                        return Container();
                                                      },
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 5.h),
                                                Expanded(
                                                  flex: 4,
                                                  child: Column(
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          templateModel.surveyId
                                                                  ?.name ??
                                                              "",
                                                          style: TextStyle(
                                                            fontSize: 10.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Row(
                                                          children: [
                                                            Expanded(
                                                              child: Column(
                                                                children: [
                                                                  Text(
                                                                    '${templateModel.fieldCount}',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            10.sp),
                                                                  ),
                                                                  Text(
                                                                      'Questions',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              8.sp)),
                                                                ],
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Column(
                                                                children: [
                                                                  Text(
                                                                    '${templateModel.avgFillingTime}',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            10.sp),
                                                                  ),
                                                                  Text(
                                                                      'to complete',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              8.sp)),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        Visibility(
                          visible: backvalgroundColor,
                          child: Positioned.fill(
                            child: BackdropFilter(
                              filter:
                                  ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                              child: Container(
                                color: Colors.black.withOpacity(0.3),
                              ),
                            ),
                          ),
                        ),
                        Visibility(
                          visible: backvalgroundColor,
                          child: Builder(
                            builder: (context) {
                              return Container(
                                alignment: Alignment.topRight,
                                width: size.width * 0.5,
                                height: 200.h,
                                color: Colors.red,
                              );
                            }
                          ),
                        ),
                      ],
                    ),
                  )
          ],
        );
      }),
    );
  }
}
