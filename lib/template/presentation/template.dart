import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survery_api_feedback_controller.dart';
import 'package:zonka_feedback/feedback/presentation/screens/setting_up_screen.dart';
import 'package:zonka_feedback/services/api_call_handling.dart';
import 'package:zonka_feedback/template/data/data_model/template_industries_map.dart';
import 'package:zonka_feedback/template/data/data_model/template_model.dart';
import 'package:zonka_feedback/template/presentation/manager/add_template_manager.dart';
import 'package:zonka_feedback/template/presentation/manager/apply_template_manager.dart';
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

class _AddTemplateScreenState extends State<AddTemplateScreen>
    with TickerProviderStateMixin {
  final getTemplateManager = Get.find<GetTemplateManager>();
  bool backvalgroundColor = false;
  final ScrollController _scrollController = ScrollController();
  final ApplyTemplateManagerController applyTemplateManagerController = Get.find<ApplyTemplateManagerController>();
  final AddTemplateManagerController addTemplateManagerController = Get.find<AddTemplateManagerController>();

  final Map<String, GlobalKey> _keyMap = {};
  GlobalKey newKey = GlobalKey();



  void applytemplateFunction(TemplateModel templateModel){
    ApiCallHandling(
                                                          controller:
                                                              applyTemplateManagerController,
                                                          status: ApiCallStatus
                                                              .Initial,
                                                          success: () {
                                                            Navigator.of(context).pop(true);
                                                          },
                                                          sendParams: true,
                                                          dialogBoxtitle:
                                                              'applying template ...')
                                                      .handleApiCall(
                                                          value: ApplyTemplateParamsValue(
                                                              surveyId:
                                                                  templateModel
                                                                          .surveyId
                                                                          ?.id ??
                                                                      "",
                                                              templateId:
                                                                  addTemplateManagerController
                                                                          .addTemplateModel
                                                                          .value
                                                                          .id ??
                                                                      ""));
  }

  Future<void> addTemplateFunction(TemplateModel templateModel)async {
     ApiCallHandling(
                                                          controller:
                                                              addTemplateManagerController,
                                                          status: ApiCallStatus
                                                              .Initial,
                                                          success: () {
                                                            applytemplateFunction(templateModel);
                                                          },
                                                          sendParams: true,
                                                          dialogBoxtitle:
                                                              'add template ...')
                                                      .handleApiCall(
                                                          value: AddTemplateParamsValue(
                                                               surveyName:
                                                            templateModel
                                                                    .surveyId
                                                                    ?.name ??
                                                                "",
                                                       
                                                        templateId:
                                                            templateModel.id ??
                                                                ""));
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Obx(() {
        return CustomScrollView(
          controller: _scrollController,
          physics:
              backvalgroundColor ? const NeverScrollableScrollPhysics() : null,
          slivers: [
            SliverAppBar(
              title: GestureDetector(
                onTap: () {},
                child: Text(
                  'Add Survey',
                  style: TextStyle(fontSize: 15.sp),
                ),
              ),
              centerTitle: true,
              iconTheme: const IconThemeData(
                color: Colors.white, // Change this to your desired color
              ),
              backgroundColor: const Color(ColorConstant.themeColor),
              titleTextStyle: TextStyle(color: Colors.white, fontSize: 15.sp),
            ),
            SliverPersistentHeader(
              key: newKey,
              delegate: PinnedHeaderDelegate(
                callbackFunction: (val) {
                  DateTime startTime = DateTime.now();
                  Offset value = val;
                  // slidingAnimation = Tween<Offset>(
                  //   begin: Offset(_scrollController.offset + 250.w,
                  //       value.dy + _scrollController.offset - 95.h),
                  //   end:
                  //       Offset(0.0, value.dy + _scrollController.offset - 95.h),
                  // ).animate(CurvedAnimation(
                  //   parent: slidingAnimationController,
                  //   curve: Curves.easeInOut,
                  // ));
                  // setState(() {
                  //   // triggerAnimation(backvalgroundColor);
                  // });
                  DateTime endTime = DateTime.now();
                  Duration executionTime = endTime.difference(startTime);

                  // Print the execution time
                  print('Execution time: ${executionTime.inMilliseconds} ms');
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
                          padding: const EdgeInsets.all(0),
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: getTemplateManager
                              .templateData.value.templateIndustriesMap.length,
                          itemBuilder: (BuildContext context, int index) {
                            List<TemplateIndustriesMap>
                                templateIndustriesMapValue = getTemplateManager
                                    .templateData.value.templateIndustriesMap;
                            String id =
                                templateIndustriesMapValue[index].id ?? '';
                            final key = GlobalKey();
                            _keyMap[id] = key;

                            return Container(
                              key: key,
                              padding: EdgeInsets.symmetric(horizontal: 12.h),
                              child: Visibility(
                                visible: getTemplateManager
                                        .filterTemplateIndustryMap[
                                            templateIndustriesMapValue[index]
                                                .id]
                                        ?.length !=
                                    0,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 5.w, top: 10.h, bottom: 5.h),
                                      child: Text(
                                          '${templateIndustriesMapValue[index].name}',
                                          style: TextStyle(
                                            fontSize: 15.sp,
                                            color: Colors.black,
                                          )),
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
                                                templateIndustriesMapValue[
                                                        index]
                                                    .id]![i];
                                        return GestureDetector(
                                          onTap: () {
                                            if (backvalgroundColor == false) {
                                              showDialog(
                                                context: context,
                                                builder: (_) =>
                                                    PreviewTemplateDialogBox(
                                                  templateModel: templateModel,
                                                ),
                                              ).then((value) async {
                                               
                                      print("templatevalue $value");
                                                if (value!=null && value=="PREVIEW_SURVEY") {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              SettingUpscreen(
                                                                screenBottom:
                                                                    SuveryScreenBottom
                                                                        .templateBottomBar,
                                                                surveyId: templateModel
                                                                        .surveyId
                                                                        ?.id ??
                                                                    "",
                                                              ))).then(
                                                      (value) async {
                                                    if (value == false) {
                                              addTemplateFunction(templateModel);
                                                    }
                                                  });
                                                } else if (value!=null && value=="ADD_SURVEY") {
                                              addTemplateFunction(templateModel);
                                                }
                                              });
                                            }
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
                                                              Radius.circular(
                                                                  10),
                                                          topRight:
                                                              Radius.circular(
                                                                  10),
                                                        ),
                                                      ),
                                                      width: double.infinity,
                                                      // child: CachedNetworkImage(
                                                      //   imageUrl: templateModel
                                                      //           .thumbnailImage ??
                                                      //       '',
                                                      //   errorWidget: (context,
                                                      //       url, error) {
                                                      //     return Container();
                                                      //   },
                                                      // ),
                                                      child: Container(),
                                                    ),
                                                  ),
                                                  SizedBox(height: 5.h),
                                                  Expanded(
                                                    flex: 4,
                                                    child: Column(
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            templateModel
                                                                    .surveyId
                                                                    ?.name ??
                                                                "",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              fontSize: 10.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
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
                              ),
                            );
                          },
                        ),

                        // AnimatedBuilder(
                        //     animation: imageFilterAnimation,
                        //     builder: (context, child) {
                        //       return BackdropFilter(
                        //         blendMode: BlendMode.luminosity,
                        //         filter: ImageFilter.blur(
                        //             sigmaX: imageFilterAnimation.value,
                        //             sigmaY: imageFilterAnimation.value),
                        //         child: Container(
                        //             color: Colors.black.withOpacity(0.5)),
                        //       );
                        //     }),
                        // AnimatedBuilder(
                        //   animation: slidingAnimation,
                        //   builder: (context, child) {
                        //     return Transform.translate(
                        //       offset: slidingAnimation.value,
                        //       child: Container(
                        //         alignment: Alignment.topRight,
                        //         width: size.width * 0.6,
                        //         height: 300.h,
                        //         padding: EdgeInsets.all(10.w),
                        //         color: Colors.white,
                        //         child: ListView.builder(
                        //             padding: const EdgeInsets.all(0),
                        //             itemCount: getTemplateManager.templateData
                        //                 .value.templateIndustriesMap.length,
                        //             itemBuilder: (context, index) {
                        //               List<TemplateIndustriesMap>
                        //                   templateIndustriesMapValue =
                        //                   getTemplateManager.templateData.value
                        //                       .templateIndustriesMap;
                        //               return Visibility(
                        //                 visible: getTemplateManager
                        //                         .filterTemplateIndustryMap[
                        //                             templateIndustriesMapValue[
                        //                                     index]
                        //                                 .id]
                        //                         ?.length !=
                        //                     0,
                        //                 child: GestureDetector(
                        //                   onTap: () {
                        //                     Scrollable.ensureVisible(_keyMap[
                        //                             templateIndustriesMapValue[
                        //                                     index]
                        //                                 .id]!
                        //                         .currentContext!);
                        //
                        //
                        //
                        //                     // triggerAnimation(backvalgroundColor);
                        //                   },
                        //                   child: Container(
                        //                     padding: EdgeInsets.all(3.h),
                        //                     child: Column(
                        //                       crossAxisAlignment:
                        //                           CrossAxisAlignment.start,
                        //                       children: [
                        //                         Text(
                        //                           templateIndustriesMapValue[
                        //                                       index]
                        //                                   .name ??
                        //                               "",
                        //                           style: TextStyle(
                        //                               fontSize: 10.sp),
                        //                         ),
                        //                         const Divider()
                        //                       ],
                        //                     ),
                        //                   ),
                        //                 ),
                        //               );
                        //             }),
                        //       ),
                        //     );
                        //   },
                        // ),
                      ],
                    ),
                  )
          ],
        );
      }),
    );
  }
}
