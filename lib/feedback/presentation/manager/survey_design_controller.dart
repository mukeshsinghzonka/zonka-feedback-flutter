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

    RxBool showIntroPage = false.obs;
    RxBool showThankyouPage = false.obs;
    RxBool showInactiveAlert = false.obs;
    RxInt thankyouScreenTimeout = 0.obs;
    RxInt appInactiveTimeOut = 0.obs;
    RxBool showExitButtonOnIntro = false.obs;
    RxBool showExitButtonONThnkyou = false.obs;
    RxBool allowGetsureToExit = false.obs;
    RxString exitPin = "".obs;
    RxString  exitPassword = "".obs;
    
    RxString redirectUrlFromWebSurvey = "".obs;
    RxInt redirectWebSurveyIn = 0.obs;

    RxBool hideLogoInDevice = false.obs;
    RxBool isEmailTrackingEnabled = false.obs;
    RxBool isSmsTrackingEnabled = false.obs;
    RxBool showSkipButtonInsteadOfNext = false.obs;
    RxBool hideDoneButtonInClickThrough = false.obs;
    RxString switchLanguageScreenDisplay = "".obs;
    RxString switchLanguageButtonDisplay = "".obs;
    RxString languagePickView = "".obs;
    RxString hidePrevNextButton = "".obs;

   


  void setFieldFromSurveyModel(){
    final valueData  = _screenFeedbackController.surveyModel.value;
    headingTextColor.value =valueData.fontColorLabel?? "#000000";
    optionTextColor.value =valueData.fontColorValue?? "#000000";
    buttonColor.value = valueData.buttonColor?? "#000000";
    fontFamily.value =valueData.fontFamily?? "Roboto";
    defaultTranslation.value = valueData.defaultLanguageCode??"en_US";
    surveyBgColor.value  = valueData.surveyBgColor?? "#FFFFFF";
    surveyBgImage.value ='${valueData.s3GalleryImageUrl}${valueData.surveyBgGalleryImageId?.companyId}/${valueData.surveyBgGalleryImageId?.path}';
    surveyBgImageLogo.value ='${valueData.s3GalleryImageUrl}${valueData.logoGalleryImageId?.companyId}/${valueData.logoGalleryImageId?.path}';
    s3GalleryImageUrl.value = valueData.s3GalleryImageUrl;
    introBgImageUrl.value = createImageUrl(valueData.introPage?.backgroundGalleryImageId?.compnayId?? "", valueData.introPage?.backgroundGalleryImageId?.path?? "");
    introLogoImageUrlLogo.value = createImageUrl(valueData.introPage?.pageLogoGalleryImageId?.compnayId?? "", valueData.introPage?.pageLogoGalleryImageId?.path?? "");
    thankyouPageUrlBg.value = createImageUrl(valueData.thankyouPage?.backgroundGalleryImageId?.compnayId?? "", valueData.thankyouPage?.backgroundGalleryImageId?.path?? "");  
    thankyouPageUrlLogo.value = createImageUrl(valueData.thankyouPage?.pageLogoGalleryImageId?.compnayId?? "", valueData.thankyouPage?.pageLogoGalleryImageId?.path?? "");
    langugagePageLogo.value = createImageUrl(valueData.languagePage?.pageLogoGalleryImageId?.compnayId??"", valueData.languagePage?.pageLogoGalleryImageId?.path??"");
    languageBackgroundPage.value = createImageUrl(valueData.languagePage?.backgroundGalleryImageId?.compnayId??"", valueData.languagePage?.backgroundGalleryImageId?.path??"");
    showIntroPage.value  = valueData.showThankyouPage??false;
    thankyouScreenTimeout.value = valueData.thankyouScreenTimeOut??0;
    showInactiveAlert.value = valueData.showInactiveAlert??false;
    appInactiveTimeOut.value = valueData.appInactiveTimeout??0;
    showExitButtonOnIntro.value=valueData.showExitButtonOnIntro??false;
    showExitButtonONThnkyou.value = valueData.showExitButtonOnThankyou??false;
    allowGetsureToExit.value=valueData.allowGestureToExit??false;
    exitPassword.value = valueData.exitPassword??"";
    exitPin.value = valueData.exitPin??"";
    isEmailTrackingEnabled.value = valueData.isEmailTrackingEnabled??false;
    isSmsTrackingEnabled.value = valueData.isSmsTrackingEnabled??false;
    redirectUrlFromWebSurvey.value = valueData.redirectUrlFromWebSurvey??"";
    redirectWebSurveyIn.value = valueData.redirectWebSurveyIn??0;
    showSkipButtonInsteadOfNext.value = valueData.showSkipButtonInsteadOfNext??false;
    hideDoneButtonInClickThrough.value = valueData.hideDoneButtonInClickThrough??false;
    switchLanguageScreenDisplay.value = valueData.switchLanguageButtonDisplay??"";
    switchLanguageButtonDisplay.value = valueData.switchLanguageScreenDisplay??"";
    languagePickView.value = valueData.languagePickView??"";
    hidePrevNextButton.value = valueData.hidePrevNextButton??"";
   
    update();
  }
   

  String createImageUrl(String companyId, String path){
    return '${ _screenFeedbackController.surveyModel.value.s3GalleryImageUrl}$companyId/$path';
  }
}