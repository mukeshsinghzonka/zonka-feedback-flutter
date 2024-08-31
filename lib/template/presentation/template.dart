import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survery_api_feedback_controller.dart';
import 'package:zonka_feedback/feedback/presentation/screens/feedback_survey_screen.dart';
import 'package:zonka_feedback/services/api_call_handling.dart';
import 'package:zonka_feedback/template/data/data_model/template_industries_map.dart';
import 'package:zonka_feedback/template/data/data_model/template_model.dart';
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
  final getTemplateManager = Get.put(GetTemplateManager());
  bool backvalgroundColor = false;
  final ScrollController _scrollController = ScrollController();
  final ApplyTemplateManagerController applyTemplateManagerController = Get.put(ApplyTemplateManagerController());
  final SurveryApiFeedbackController surveryFeedbackController = Get.put(SurveryApiFeedbackController());
  late AnimationController slidingAnimationController;
  late Animation<Offset> slidingAnimation;
  late AnimationController imageAnimationController;
  late Animation<double> imageFilterAnimation;
  final Map<String, GlobalKey> _keyMap = {};
  GlobalKey newKey = GlobalKey();

  @override
  void initState() {
    getTemplateManager.call();
    slidingAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    imageAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    imageFilterAnimation =
        Tween<double>(begin: 0, end: 5).animate(CurvedAnimation(
      parent: imageAnimationController,
      curve: Curves.easeInOut,
    ));
    slidingAnimation = Tween<Offset>(
      begin: Offset(250.w, 0),
      end: const Offset(0.0, 0),
    ).animate(CurvedAnimation(
      parent: slidingAnimationController,
      curve: Curves.easeInOut,
    ));

    super.initState();
  }

  @override
  void dispose() {
    slidingAnimationController.dispose();
    imageAnimationController.dispose();
    super.dispose();
  }

  void triggerAnimation(bool activate) {
    if (activate) {
      slidingAnimationController.forward();
      imageAnimationController.forward();
    } else {
      slidingAnimationController.reverse();
      imageAnimationController.reverse();
    }
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
              key: newKey,
              delegate: PinnedHeaderDelegate(
                callbackFunction: (val) {
                  Offset value = val;
                  slidingAnimation = Tween<Offset>(
                    begin: Offset(
                     _scrollController.offset+  250.w, value.dy + _scrollController.offset - 95.h),
                    end: Offset(0.0, value.dy + _scrollController.offset - 95.h),
                  ).animate(CurvedAnimation(
                    parent: slidingAnimationController,
                    curve: Curves.easeInOut,
                  ));
                  setState(() {
                    backvalgroundColor = !backvalgroundColor;
                    triggerAnimation(backvalgroundColor);
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
                                              ).then((value) {
                                                if (value) {
                                                  ApiCallHandling(
                                                          controller:
                                                              surveryFeedbackController,
                                                          status: ApiCallStatus
                                                              .Initial,
                                                          sendParams: true,
                                                          success: () {
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            const SurveyScreenFeedbackPage(
                                                                              screenBottom: SuveryScreenBottom.templateBottomBar,
                                                                            ))).then((value){
                                                                              print("applytemplayev $value");
                                                                              if(value == false){
  applyTemplateManagerController
                                                      .call(ParamsValue(
                                                        surveyName: templateModel.surveyId?.name??"",
                                                          surveyId:
                                                              templateModel
                                                                      .surveyId
                                                                      ?.id ??
                                                                  "",
                                                          templateId:
                                                              templateModel
                                                                      .id ??
                                                                  ""));
                                                                              }
                                                                            });
                                                          })
                                                      .handleApiCall(
                                                          value: templateModel
                                                                  .surveyId
                                                                  ?.id ??
                                                              "");
                                                } else {
                                                  applyTemplateManagerController
                                                      .call(ParamsValue(
                                                        surveyName: templateModel.surveyId?.name??"",
                                                          surveyId:
                                                              templateModel
                                                                      .surveyId
                                                                      ?.id ??
                                                                  "",
                                                          templateId:
                                                              templateModel
                                                                      .id ??
                                                                  ""));
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
                                                      child: CachedNetworkImage(
                                                        imageUrl: templateModel
                                                                .thumbnailImage ??
                                                            '',
                                                        errorWidget: (context,
                                                            url, error) {
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
                        AnimatedBuilder(
                            animation: imageFilterAnimation,
                            builder: (context, child) {
                              return BackdropFilter(
                                blendMode: BlendMode.luminosity,
                                filter: ImageFilter.blur(
                                    sigmaX: imageFilterAnimation.value,
                                    sigmaY: imageFilterAnimation.value),
                                child: Container(
                                    color: Colors.black.withOpacity(0.5)),
                              );
                            }),
                        AnimatedBuilder(
                          animation: slidingAnimation,
                          builder: (context, child) {
                            return Transform.translate(
                              offset: slidingAnimation.value,
                              child: Container(
                                alignment: Alignment.topRight,
                                width: size.width * 0.6,
                                height: 300.h,
                                padding: EdgeInsets.all(10.w),
                                color: Colors.white,
                                child: ListView.builder(
                                    padding: const EdgeInsets.all(0),
                                    itemCount: getTemplateManager.templateData
                                        .value.templateIndustriesMap.length,
                                    itemBuilder: (context, index) {
                                      List<TemplateIndustriesMap>
                                          templateIndustriesMapValue =
                                          getTemplateManager.templateData.value
                                              .templateIndustriesMap;
                                      return Visibility(
                                        visible: getTemplateManager
                                                .filterTemplateIndustryMap[
                                                    templateIndustriesMapValue[
                                                            index]
                                                        .id]
                                                ?.length !=
                                            0,
                                        child: GestureDetector(
                                          onTap: () {
                                            Scrollable.ensureVisible(_keyMap[
                                                    templateIndustriesMapValue[
                                                            index]
                                                        .id]!
                                                .currentContext!);

                                            backvalgroundColor =
                                                !backvalgroundColor;
                                            triggerAnimation(
                                                backvalgroundColor);
                                          },
                                          child: Container(
                                            padding: EdgeInsets.all(3.h),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  templateIndustriesMapValue[
                                                              index]
                                                          .name ??
                                                      "",
                                                  style: TextStyle(
                                                      fontSize: 10.sp),
                                                ),
                                                const Divider()
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                              ),
                            );
                          },
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
