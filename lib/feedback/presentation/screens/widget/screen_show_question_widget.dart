import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/field_model.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_collect_data_controller.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_question_show_controller.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_design_controller.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_next_screen_controller.dart';
import 'package:zonka_feedback/utils/enum_util.dart';
import 'package:zonka_feedback/utils/hexcolor_util.dart';

class SwitchScreenWidget extends StatefulWidget {
  final List<Field> feedbackQuestion;
  final int index;
  const SwitchScreenWidget({super.key, required this.feedbackQuestion, required this.index});

  @override
  State<SwitchScreenWidget> createState() => _SwitchScreenWidgetState();
}

class _SwitchScreenWidgetState extends State<SwitchScreenWidget> {
  final ScreenFeedBackQuesController screenFeedBackQuesController =
      Get.put(ScreenFeedBackQuesController());
  final SurveyDesignFieldController surveyFieldController =
      Get.find<SurveyDesignFieldController>();
  final SurveyScreenManager surveyScreenManager =
      Get.find<SurveyScreenManager>();
  final SurveyCollectDataController surveyCollectDataController =
      Get.put(SurveyCollectDataController());
  final double headerHeight = 100;
   bool showFirstWidget = true;
  @override
  void dispose() {
    Get.delete<ScreenFeedBackQuesController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: surveyScreenManager.formKey,
      child: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                // Build the list of items
                return Visibility(
                  visible: surveyScreenManager.hideSurveyWidget.containsKey(widget.feedbackQuestion[index].fieldName ?? "")? surveyScreenManager.hideSurveyWidget[widget.feedbackQuestion[index].fieldName ?? ""] ??true: true,
                  child: ConstrainedBox(
                    constraints:  BoxConstraints(minHeight: widget.feedbackQuestion.length > 1 ? double.minPositive: MediaQuery.of(context).size.height * 0.7 ,),
                    child: Container(
                      key: ValueKey<String>(widget.feedbackQuestion[index].id ?? ""), 
                      margin: EdgeInsets.all(5.w),     
                      alignment: Alignment.center,
                      decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent)),
                      child: Column(
                        children: [
                         Text(widget.feedbackQuestion[index].fieldName?? ""),   
                          
                          Container(
                              margin: EdgeInsets.symmetric(vertical: 5.h),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent)),
                              child: Text(
                                '${widget.feedbackQuestion[index].translations?[surveyFieldController.defaultTranslation.value]?.fieldLabel}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 6.sp,
                                    fontFamily:
                                        surveyFieldController.fontFamily.value,
                                    color: HexColor(surveyFieldController
                                        .headingTextColor.value)),
                              )),
                          Visibility(
                            visible: widget
                                    .feedbackQuestion[index]
                                    .translations?[surveyFieldController
                                        .defaultTranslation.value]
                                    ?.subTitle !=
                                "",
                            child: Container(
                              margin: EdgeInsets.symmetric(vertical: 5.h),
                              child: Text(
                                '${widget.feedbackQuestion[index].translations?[surveyFieldController.defaultTranslation.value]?.subTitle}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 6.sp,
                                    color: HexColor(surveyFieldController
                                        .headingTextColor.value)),
                              ),
                            ),
                          ),
                          Obx(() {
                            return Visibility(
                              visible: surveyScreenManager.showIsRequired!.containsKey(widget.feedbackQuestion[index].id ?? "") == true,
                              child: Container(
                                padding: EdgeInsets.all(5.h),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.r)),
                                    border: Border.all(color: Colors.red)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.dnd_forwardslash,
                                      color: Colors.red,
                                      size: 8.sp,
                                    ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Builder(builder: (context) {
                                      if (surveyScreenManager.showIsRequired![widget.feedbackQuestion[index].id ??""]?.value == ScreenValidationErrorType.REQUIRED) {
                                        return Text(
                                          surveyScreenManager
                                                      .showIsRequired![widget
                                                              .feedbackQuestion[
                                                                  index]
                                                              .id ??
                                                          ""]!
                                                      .message !=
                                                  null
                                              ? surveyScreenManager
                                                      .showIsRequired![widget
                                                              .feedbackQuestion[
                                                                  index]
                                                              .id ??
                                                          ""]!
                                                      .message ??
                                                  ""
                                              : 'This is a required field',
                                          style: const TextStyle(
                                            color: Colors.red,
                                          ),
                                        );
                                      } else if (surveyScreenManager
                                              .showIsRequired![widget
                                                      .feedbackQuestion[index]
                                                      .id ??
                                                  ""]
                                              ?.value ==
                                          ScreenValidationErrorType
                                              .WRONGSELECTION) {
                                        return Text(
                                          'Please make the right number of selections.',
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 5.sp),
                                        );
                                      }
                                      return Container();
                                    }),
                                  ],
                                ),
                              ),
                            );
                          }),
                          Builder(
                            builder: (context) {
                            if (widget.feedbackQuestion[index].quesImages.isEmpty) {
                              return Container();
                            }
                            return Container(
                              height: 150.h,
                              margin: EdgeInsets.all(3.w),
                              decoration: BoxDecoration(
                                borderRadius:BorderRadius.all(Radius.circular(10.r)),
                              ),
                              child: widget.feedbackQuestion[index].quesImages.isNotEmpty
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(10.r),
                                      child: Image.network(
                                        fit: BoxFit.cover,
                                        '${surveyFieldController.s3GalleryImageUrl.value}${widget.feedbackQuestion[index].quesImages.first.companyId}/${widget.feedbackQuestion[index].quesImages.first.path}',
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return Container();
                                        },
                                      ),
                                    )
                                  : Container(),
                            );
                          }),
                          screenFeedBackQuesController.getScreenType(widget.feedbackQuestion[index].fieldName ?? "",widget.feedbackQuestion[index]),
                        ],
                      ),
                    ),
                  ),
                );
              },
              childCount: widget.feedbackQuestion.length, // Number of items in the list
            ),
          ),
        ],
      ),
    );
  }
}
