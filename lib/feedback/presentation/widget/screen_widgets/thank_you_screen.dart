import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
// import 'package:zonka_feedback/feedback/data/data_model_new/submit_reponse_model/device_model.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/thankyou_model.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_design_controller.dart';
import 'package:zonka_feedback/feedback/presentation/screens/widget/exit_widget.dart';
import 'package:zonka_feedback/feedback/presentation/screens/widget/template_widget.dart';
import 'package:zonka_feedback/surveys/presentation/manager/survey_sync_controller.dart';
import 'package:zonka_feedback/utils/enum_util.dart';
import 'package:zonka_feedback/utils/hexcolor_util.dart';

import '../../../../utils/global_value_notifier.dart';


class ThankYouWidget extends StatefulWidget {
  final ThankyouPage? field;
  const ThankYouWidget({super.key, required this.field});

  @override
  State<ThankYouWidget> createState() => _ThankYouWidgetState();
}

class _ThankYouWidgetState extends State<ThankYouWidget> {
  
  final SurveyDesignFieldController surveyFieldController = Get.find<SurveyDesignFieldController>();
  final SurveySyncController surveySyncController = Get.put(SurveySyncController());

  @override
  void initState() {
    super.initState();
    if(isPreviewModeOn.value == false) {
      surveySyncController.asyncDurationValue(syncType: 'Automatic');
    }

  }


@override
  void dispose() {
    // TODO: implement dispose
  Get.delete<SurveySyncController>();
    super.dispose();
  }
 
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          onError: (exception, stackTrace) {},
          fit: BoxFit.cover,
          image: NetworkImage(surveyFieldController.thankyouPageUrlBg.value),
        ),
        color: HexColor(widget.field?.pageBgColor ?? ""),
      ),
      child: Column(
        children: [
//           Expanded(
//   child: SizedBox(
//     height: 100.h,
//     child: Image.network(
//       surveyFieldController.thankyouPageUrlLogo.value,
//       errorBuilder: (context, error, stackTrace) {
//         // Optionally, log the error
//         debugPrint('Image load failed: $error');
//
//         // Return a fallback widget like a placeholder image or text
//         return Container(
//           alignment: Alignment.center,
//           child: const Icon(
//             Icons.broken_image,
//             size: 50,
//             color: Colors.grey,
//           ),
//         );
//       },
//     ),
//   ),
// ),
          SizedBox(
            height: 100.h,
          ),
          Expanded(
            flex: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    widget
                            .field!
                            .translations![surveyFieldController
                                .defaultTranslation.value]
                            ?.upperText ??
                        "",
                    style: TextStyle(
                        fontSize: 10.sp,
                        fontFamily: widget.field?.fontFamilyUpperText ?? "",
                        color: HexColor(
                            widget.field?.fontColorUpperText ?? ""))),
                Container(
                  padding: EdgeInsets.all(10.w),
                  child: Text(
                      widget
                              .field!
                              .translations![surveyFieldController
                                  .defaultTranslation.value]
                              ?.bottomText ??
                          "",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 8.sp,
                          fontFamily:
                              widget.field?.fontFamilyBottomText ?? "",
                          color: HexColor(
                              widget.field?.fontColorBottomText ?? ""))),
                ),
              ],
            ),
          ),
          Obx(() {
            if (surveyFieldController.screenBotton.value ==
                SuveryScreenBottom.templateBottomBar) {
              return const TemplateBottomFeedback();
            }
            return const ExitWidget();
          })
        ],
      ),
    );
  }
}
