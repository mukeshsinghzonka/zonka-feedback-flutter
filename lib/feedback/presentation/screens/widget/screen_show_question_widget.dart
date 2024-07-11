import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/field_model.dart';
import 'package:zonka_feedback/feedback/presentation/manager/screen_show_controller.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_field_controller.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_screen_controller.dart';
import 'package:zonka_feedback/utils/hexcolor_util.dart';

class SwitchScreenWidget extends StatefulWidget {
  final List<Field> feedbackQuestion;
  const SwitchScreenWidget({super.key, required this.feedbackQuestion});

  @override
  State<SwitchScreenWidget> createState() => _SwitchScreenWidgetState();
}

class _SwitchScreenWidgetState extends State<SwitchScreenWidget> {
  final ScreenFeedBackQuesController screenFeedBackQuesController =
      Get.put(ScreenFeedBackQuesController());
  final SurveyFieldController surveyFieldController =
      Get.find<SurveyFieldController>();
  final SurveyScreenManager surveyScreenManager =
      Get.find<SurveyScreenManager>();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.feedbackQuestion.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(top: 10.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent)),
                    child: Text(
                      '${widget.feedbackQuestion[index].translations?[surveyFieldController.defaultTranslation.value]?.fieldLabel}',
                      style: TextStyle(
                          fontSize: 6.sp,
                          color: HexColor(
                              surveyFieldController.headingTextColor.value)),
                    )),
                SizedBox(
                  height: 5.h,
                ),
                Visibility(
                  visible: surveyScreenManager.nextScreenstop.value == true,
                  child: Container(
                    width: 70.w,
                    padding: EdgeInsets.symmetric(vertical: 3.h),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.r)),
                        border: Border.all(color: Colors.red)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.dnd_forwardslash,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        const Text(
                          'This is a required field',
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                ),
                Builder(builder: (context) {
                  if (widget.feedbackQuestion[index].quesImages.isEmpty) {
                    return Container();
                  }
                  return Container(
                    height: 150.h,
                    margin: EdgeInsets.all(3.w),
                    child: widget.feedbackQuestion[index].quesImages.isNotEmpty
                        ? Image.network(
                            '${surveyFieldController.s3GalleryImageUrl.value}${widget.feedbackQuestion[index].quesImages.first.companyId}/${widget.feedbackQuestion[index].quesImages.first.path}',
                            errorBuilder: (context, error, stackTrace) {
                              return Container();
                            },
                          )
                        : Container(),
                  );
                }),
                Container(
                    height: 200.h,
                    width: 300.w,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent)),
                    alignment: Alignment.topCenter,
                    child: screenFeedBackQuesController.getScreenType(
                        widget.feedbackQuestion[index].fieldName ?? "",
                        widget.feedbackQuestion[index]))
              ],
            ),
          );
        });
  }
}
