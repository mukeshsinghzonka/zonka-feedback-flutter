import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/field_model.dart';
import 'package:zonka_feedback/feedback/presentation/manager/screen_show_controller.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_screen_controller.dart';

class SwitchScreenWidget extends StatefulWidget {
  final List<Field> feedbackQuestion;
  const SwitchScreenWidget({super.key, required this.feedbackQuestion});

  @override
  State<SwitchScreenWidget> createState() => _SwitchScreenWidgetState();
}

class _SwitchScreenWidgetState extends State<SwitchScreenWidget> {
  final SurveyScreenManager surveyScreenManager =
      Get.find<SurveyScreenManager>();
  final ScreenFeedBackQuesController screenFeedBackQuesController =
      Get.put(ScreenFeedBackQuesController());
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.feedbackQuestion.length,
        itemBuilder: (context, index) {
print( "FieldName: ${widget.feedbackQuestion[index].fieldName}");

          return Container(
            margin: EdgeInsets.only(top: 10.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                    height: 90.h,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent)),
                    child: const Text('Picture Choice')),
                SizedBox(
                  height: 5.h,
                ),
               Container(
                      height: 200.h,
                      width: 300.w,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent)),
                      alignment: Alignment.topCenter,
                      child: screenFeedBackQuesController.getScreenType(widget.feedbackQuestion[index].fieldName??""))
              ],
            ),
          );
        });
  }
}
