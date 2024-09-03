import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zonka_feedback/feedback/data/data_model_new/field_model.dart';
import 'package:zonka_feedback/feedback/domain/usecase/survey_image_upload_uc.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survery_api_feedback_controller.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_design_controller.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survey_image_upload_manager.dart';
import 'package:zonka_feedback/feedback/presentation/manager/validation_logic_manager.dart';
import 'package:zonka_feedback/services/image_picker_service.dart';
import 'package:zonka_feedback/utils/hexcolor_util.dart';

class ImageCaptureWidget extends StatefulWidget {
  final Field field;
  const ImageCaptureWidget({super.key, required this.field});

  @override
  State<ImageCaptureWidget> createState() => _ImageCaptureWidgetState();
}

class _ImageCaptureWidgetState extends State<ImageCaptureWidget> {
  final SurveyDesignFieldController surveyFieldController =
      Get.find<SurveyDesignFieldController>();
  final ImagePickerService imagePickerService = ImagePickerService();
  final SurveyImageUploadManager surveyImageUploadManager =
      Get.put(SurveyImageUploadManager());
  final SurveryApiFeedbackController surveryApiFeedbackController =
      Get.find<SurveryApiFeedbackController>();
  String? imageUrlLink = null;

  bool imageloading = false;
  late ValidationLogicManager validationLogicManager;
  @override
  void initState() {
    validationLogicManager = ValidationLogicManager(field: widget.field);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FormField(validator: (value) {
      if (widget.field.required == true && imageUrlLink == null) {
        validationLogicManager.requiredFormValidator(imageUrlLink == null);
      }
      return null;
    }, builder: (context) {
      return GestureDetector(
        onTap: () async {
          setState(() {
            imageloading = true;
          });
          XFile? file = await imagePickerService.takeImage();
          await surveyImageUploadManager.call(SurveyImageUploadUcParams(
              fileName: file!.name,
              filePath: file.path,
              referenceCode:
                  surveryApiFeedbackController.surveyModel.value.id ?? ""));
          setState(() {
            imageloading = false;
            imageUrlLink = surveyImageUploadManager.imageUrl.value;
          });
        },
        child: Builder(
          builder: (context) {
          if (imageUrlLink != null) {
            return GestureDetector(
              onTap: () async {
                await showDialog(
                    context: context,
                    builder: (context) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Dialog(
                          backgroundColor: Colors.transparent,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Image.network(
                                    surveyImageUploadManager.imageUrl.value,
                                  ),
                                ),
                                Expanded(
                                    child: GestureDetector(
                                        onTap: () {
                                          imageUrlLink = null;
                                          Navigator.of(context).pop();
                                          setState(() {});
                                        },
                                        child: Icon(
                                          Icons.delete,
                                          color: Colors.grey,
                                          size: 30.sp,
                                        )))
                              ],
                            ),
                          
                        ),
                      );
                    });
              },
              child: Image.network(
                surveyImageUploadManager.imageUrl.value,
                height: 250.h,
                width: 200.w,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) return child;
                  return SizedBox(
                    height: 250.h,
                    width: 200.w,
                    child: Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    ),
                  );
                },
              ),
            );
          }
          return Container(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width / 3,
            decoration: BoxDecoration(
                border: Border.all(
                    color:
                        HexColor(surveyFieldController.optionTextColor.value)),
                color: HexColor(surveyFieldController.optionTextColor.value)
                    .withOpacity(0.1),
                borderRadius: BorderRadius.all(Radius.circular(5.r))),
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                imageloading ? CircularProgressIndicator() : Container(),
                Icon(Icons.camera_alt),
              ],
            ),
          );
        }),
      );
    });
  }
}
