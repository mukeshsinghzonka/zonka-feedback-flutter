import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/field_model.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_design_controller.dart';
import 'package:zonka_feedback/services/image_picker_service.dart';
import 'package:zonka_feedback/utils/hexcolor_util.dart';

class ImageCaptureWidget extends StatefulWidget {
  final Field field;
  const ImageCaptureWidget({super.key, required this.field});

  @override
  State<ImageCaptureWidget> createState() => _ImageCaptureWidgetState();
}

class _ImageCaptureWidgetState extends State<ImageCaptureWidget> {
  final SurveyDesignFieldController surveyFieldController = Get.find<SurveyDesignFieldController>();
   final  ImagePickerService imagePickerService = ImagePickerService();
  @override
  Widget build(BuildContext context) {
    return FormField(
      validator: (value) {
          return null;
      },
      builder: (context) {
        return GestureDetector(
          onTap: () async  {
            XFile ?  file =  await imagePickerService.takeImage();  
          },
          child: Container(
            height: 250.h,
            width: 250.h,
            decoration: BoxDecoration(
                border: Border.all(
                    color: HexColor(surveyFieldController.optionTextColor.value)),
                color: HexColor(surveyFieldController.optionTextColor.value)
                    .withOpacity(0.1),
                borderRadius: BorderRadius.all(Radius.circular(5.r))),
            child: const Icon(Icons.camera_alt),
          ),
        );
      }
    );
  }
}
