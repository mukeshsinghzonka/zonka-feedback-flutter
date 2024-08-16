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
   RxString introLogoImageUrl = "".obs;
   RxString introBgImageUrl = "".obs;
   RxString introLogoImageUrlLogo = "".obs; 
   RxString thankyouPageUrlLogo = "".obs;
   RxString thankyouPageUrlBg = "".obs;
   RxString langugagePageLogo = "".obs;
   RxString languageBackgroundPage = "".obs;

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
    introBgImageUrl.value = createImageUrl(_screenFeedbackController.surveyModel.value.introPage?.backgroundGalleryImageId?.compnayId?? "", _screenFeedbackController.surveyModel.value.introPage?.backgroundGalleryImageId?.path?? "");
    introLogoImageUrlLogo.value = createImageUrl(_screenFeedbackController.surveyModel.value.introPage?.pageLogoGalleryImageId?.compnayId?? "", _screenFeedbackController.surveyModel.value.introPage?.pageLogoGalleryImageId?.path?? "");
    thankyouPageUrlBg.value = createImageUrl(_screenFeedbackController.surveyModel.value.thankyouPage?.backgroundGalleryImageId?.compnayId?? "", _screenFeedbackController.surveyModel.value.thankyouPage?.backgroundGalleryImageId?.path?? "");  
    thankyouPageUrlLogo.value = createImageUrl(_screenFeedbackController.surveyModel.value.thankyouPage?.pageLogoGalleryImageId?.compnayId?? "", _screenFeedbackController.surveyModel.value.thankyouPage?.pageLogoGalleryImageId?.path?? "");
    langugagePageLogo.value = createImageUrl(_screenFeedbackController.surveyModel.value.languagePage?.pageLogoGalleryImageId?.compnayId??"", _screenFeedbackController.surveyModel.value.languagePage?.pageLogoGalleryImageId?.path??"");
    languageBackgroundPage.value = createImageUrl(_screenFeedbackController.surveyModel.value.languagePage?.backgroundGalleryImageId?.compnayId??"", _screenFeedbackController.surveyModel.value.languagePage?.backgroundGalleryImageId?.path??"");
    update();
  }
   

  String createImageUrl(String companyId, String path){
    return '${_screenFeedbackController.surveyModel.value.s3GalleryImageUrl}$companyId/$path';
  }
}