import 'package:get/get.dart';
import 'package:zonka_feedback/feedback/presentation/manager/survery_api_feedback_controller.dart';

class SurveyDesignFieldController extends GetxController {

  final SurveryApiFeedbackController _screenFeedbackController = Get.find<SurveryApiFeedbackController>();
 
   RxString headingTextColor = '#000000'.obs;
   RxString optionTextColor = '#000000'.obs;
   RxString buttonColor ='#000000'.obs;
   RxString fontFamily = "Roboto".obs;
   RxString defaultTranslation = "en_US".obs;
   RxString surveyBgColor = "#FFFFFF".obs;
   RxString surveyBgImage = "".obs;
   RxString surveyBgImageLogo = "".obs;
   RxString s3GalleryImageUrl = "".obs;
   

  void setFieldFromSurveyModel(){
    headingTextColor.value =_screenFeedbackController.surveyModel.value.fontColorLabel?? "#000000";
    optionTextColor.value =_screenFeedbackController.surveyModel.value.fontColorValue?? "#000000";
    buttonColor.value = _screenFeedbackController.surveyModel.value.buttonColor?? "#000000";
    fontFamily.value =_screenFeedbackController.surveyModel.value.fontFamily?? "Roboto";
    defaultTranslation.value = _screenFeedbackController.surveyModel.value.defaultLanguageCode??"en_US";
    surveyBgColor.value  = _screenFeedbackController.surveyModel.value.surveyBgColor?? "#FFFFFF";
    surveyBgImage.value ='${_screenFeedbackController.surveyModel.value.s3GalleryImageUrl}${_screenFeedbackController.surveyModel.value.surveyBgGalleryImageId?.companyId}/${_screenFeedbackController.surveyModel.value.surveyBgGalleryImageId?.path}';
    surveyBgImageLogo.value ='${_screenFeedbackController.surveyModel.value.s3GalleryImageUrl}${_screenFeedbackController.surveyModel.value.logoGalleryImageId?.companyId}/${_screenFeedbackController.surveyModel.value.logoGalleryImageId?.path}';
    s3GalleryImageUrl.value = _screenFeedbackController.surveyModel.value.s3GalleryImageUrl;
    update();
  }
   
}